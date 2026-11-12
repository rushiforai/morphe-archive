.class public final Lrkb;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Lpde;

.field public final c:Lpde;

.field public final d:Lxh7;

.field public final e:Loji;

.field public final f:Ljava/util/LinkedHashMap;

.field public final g:Ljava/util/LinkedHashMap;

.field public h:Landroid/graphics/drawable/Drawable;

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:Landroid/graphics/drawable/Drawable;

.field public k:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Lpde;Landroidx/recyclerview/widget/RecyclerView;Lpde;Lpde;Lxh7;Loji;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lrkb;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Lrkb;->b:Lpde;

    iput-object p4, p0, Lrkb;->c:Lpde;

    iput-object p5, p0, Lrkb;->d:Lxh7;

    iput-object p6, p0, Lrkb;->e:Loji;

    new-instance p6, Ljava/util/LinkedHashMap;

    invoke-direct {p6}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p6, p0, Lrkb;->f:Ljava/util/LinkedHashMap;

    new-instance p6, Ljava/util/LinkedHashMap;

    invoke-direct {p6}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p6, p0, Lrkb;->g:Ljava/util/LinkedHashMap;

    new-instance p6, Lpc5;

    const/16 v0, 0x1d

    invoke-direct {p6, p0, v0}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p6}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    new-instance p2, Lnkb;

    const/4 p6, 0x0

    invoke-direct {p2, p0, p6}, Lnkb;-><init>(Lrkb;B)V

    invoke-static {p3, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Lnkb;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lnkb;-><init>(Lrkb;B)V

    invoke-static {p4, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Lokb;

    invoke-direct {p2, p0, p6}, Lokb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p5, p1, p2}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 5

    iget-object v0, p0, Lrkb;->b:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v1, v0, Leyj;->m:Lb8h;

    iget-object v2, p0, Lrkb;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lrkb;->h:Landroid/graphics/drawable/Drawable;

    iget-object v1, v0, Leyj;->n:Lb8h;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lrkb;->i:Landroid/graphics/drawable/Drawable;

    iget-object v1, v0, Leyj;->o:Lb8h;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lrkb;->j:Landroid/graphics/drawable/Drawable;

    iget-object v0, v0, Leyj;->q:Lb8h;

    if-eqz v0, :cond_47

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_48

    :cond_47
    const/4 v0, 0x0

    :goto_48
    iput-object v0, p0, Lrkb;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final f(IIIIIF)V
    .registers 8

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p0, p0, Lrkb;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_14

    new-instance v0, Lqkb;

    invoke-direct {v0}, Lqkb;-><init>()V

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    check-cast v0, Lqkb;

    iget-object p0, v0, Lqkb;->a:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_22

    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_25

    :cond_22
    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Rect;->union(IIII)V

    :goto_25
    iget p0, v0, Lqkb;->c:F

    cmpg-float p1, p0, p6

    if-ltz p1, :cond_2c

    move p6, p0

    :cond_2c
    iput p6, v0, Lqkb;->c:F

    iget p0, v0, Lqkb;->b:I

    add-int/lit8 p0, p0, 0x1

    iput p0, v0, Lqkb;->b:I

    return-void
.end method

.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 10

    invoke-super {p0, p1, p2, p3, p4}, Liph;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    invoke-virtual {p3}, Landroid/view/View;->getLayoutDirection()I

    move-result p4

    const/4 v0, 0x1

    if-eq p4, v0, :cond_b

    const/4 v0, 0x0

    :cond_b
    iget-object p4, p0, Lrkb;->b:Lpde;

    invoke-virtual {p4}, Lekc;->g()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Leyj;

    iget-object p4, p4, Leyj;->j:Loxj;

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p3

    const/4 v1, -0x1

    iget-object v2, p0, Lrkb;->f:Ljava/util/LinkedHashMap;

    if-ne p3, v1, :cond_3b

    invoke-virtual {v2, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/graphics/Rect;

    if-eqz p3, :cond_3b

    iget p0, p3, Landroid/graphics/Rect;->top:I

    iput p0, p1, Landroid/graphics/Rect;->top:I

    iget p0, p3, Landroid/graphics/Rect;->left:I

    iput p0, p1, Landroid/graphics/Rect;->left:I

    iget p0, p3, Landroid/graphics/Rect;->right:I

    iput p0, p1, Landroid/graphics/Rect;->right:I

    iget p0, p3, Landroid/graphics/Rect;->bottom:I

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    return-void

    :cond_3b
    instance-of p3, p2, Lpkb;

    if-nez p3, :cond_40

    return-void

    :cond_40
    move-object p3, p2

    check-cast p3, Lpkb;

    invoke-interface {p3}, Lpkb;->n()Z

    move-result v1

    if-eqz v1, :cond_6e

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget-object v3, p4, Loxj;->c:Lsxj;

    iget v4, v3, Lsxj;->b:I

    add-int/2addr v1, v4

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v4, v3, Lsxj;->d:I

    add-int/2addr v1, v4

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3, v0}, Lsxj;->a(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget-object v3, p4, Loxj;->c:Lsxj;

    invoke-virtual {v3, v0}, Lsxj;->b(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->right:I

    goto :goto_bd

    :cond_6e
    invoke-interface {p3}, Lpkb;->N()Z

    move-result v1

    if-eqz v1, :cond_99

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget-object v3, p4, Loxj;->d:Lsxj;

    iget v4, v3, Lsxj;->b:I

    add-int/2addr v1, v4

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v4, v3, Lsxj;->d:I

    add-int/2addr v1, v4

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3, v0}, Lsxj;->a(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget-object v3, p4, Loxj;->d:Lsxj;

    invoke-virtual {v3, v0}, Lsxj;->b(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->right:I

    goto :goto_bd

    :cond_99
    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget-object v3, p4, Loxj;->a:Lsxj;

    iget v4, v3, Lsxj;->b:I

    add-int/2addr v1, v4

    iput v1, p1, Landroid/graphics/Rect;->top:I

    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v4, v3, Lsxj;->d:I

    add-int/2addr v1, v4

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3, v0}, Lsxj;->a(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget-object v3, p4, Loxj;->a:Lsxj;

    invoke-virtual {v3, v0}, Lsxj;->b(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->right:I

    :goto_bd
    invoke-interface {p3}, Lpkb;->getGroupId()I

    move-result v1

    if-eqz v1, :cond_105

    invoke-interface {p3}, Lpkb;->d()Z

    move-result v1

    if-nez v1, :cond_105

    iget-object p0, p0, Lrkb;->c:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly2c;

    invoke-interface {p0, p2}, Ly2c;->a(Landroidx/recyclerview/widget/i;)Lx2c;

    move-result-object p0

    if-eqz p0, :cond_105

    iget-boolean v1, p0, Lx2c;->a:Z

    if-eqz v1, :cond_e6

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget-object v3, p4, Loxj;->b:Lsxj;

    invoke-virtual {v3, v0}, Lsxj;->a(Z)I

    move-result v3

    add-int/2addr v3, v1

    iput v3, p1, Landroid/graphics/Rect;->left:I

    :cond_e6
    iget-boolean p0, p0, Lx2c;->b:Z

    if-eqz p0, :cond_f5

    iget p0, p1, Landroid/graphics/Rect;->right:I

    iget-object v1, p4, Loxj;->b:Lsxj;

    invoke-virtual {v1, v0}, Lsxj;->b(Z)I

    move-result v0

    add-int/2addr v0, p0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    :cond_f5
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget-object v0, p4, Loxj;->b:Lsxj;

    iget v1, v0, Lsxj;->b:I

    add-int/2addr p0, v1

    iput p0, p1, Landroid/graphics/Rect;->top:I

    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, v0, Lsxj;->d:I

    add-int/2addr p0, v0

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    :cond_105
    invoke-interface {p3}, Lpkb;->n()Z

    move-result p0

    if-eqz p0, :cond_116

    iget p0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput p0, p1, Landroid/graphics/Rect;->top:I

    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    :cond_116
    invoke-virtual {v2, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_124

    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    invoke-interface {v2, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_124
    check-cast p0, Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    invoke-super/range {p0 .. p3}, Liph;->onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    iget-object v1, v0, Lrkb;->e:Loji;

    iget-object v1, v1, Loji;->a:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Lc5l;

    iget-object v1, v0, Lrkb;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutDirection()I

    move-result v1

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-ne v1, v11, :cond_1c

    move v12, v11

    goto :goto_1d

    :cond_1c
    move v12, v10

    :goto_1d
    iget-object v1, v0, Lrkb;->b:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-object v13, v1, Leyj;->j:Loxj;

    new-instance v1, Lg6n;

    invoke-direct {v1, v8}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_30
    :goto_30
    move-object v1, v14

    check-cast v1, Lh6n;

    invoke-virtual {v1}, Lh6n;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v2, :cond_112

    invoke-virtual {v1}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Landroid/view/View;

    invoke-virtual {v8, v15}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v1

    instance-of v2, v1, Lpkb;

    if-eqz v2, :cond_30

    instance-of v2, v1, Lh5l;

    if-nez v2, :cond_5d

    iget-object v5, v9, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v5, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5d

    iget-object v5, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v5

    goto :goto_5e

    :cond_5d
    move v5, v3

    :goto_5e
    invoke-static {v5}, Lzed;->b(F)I

    move-result v16

    if-nez v2, :cond_73

    iget-object v2, v9, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_73

    iget-object v2, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v2

    goto :goto_74

    :cond_73
    move v2, v3

    :goto_74
    invoke-static {v2}, Lzed;->b(F)I

    move-result v17

    iget-object v2, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v5, Lx46;->b:Lx46;

    const v6, 0x7f0a0b4a

    invoke-virtual {v2, v6}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_94

    check-cast v2, Lv46;

    iget-object v6, v2, Lv46;->b:Landroid/animation/ValueAnimator;

    iget-object v2, v2, Lv46;->a:Lx46;

    if-ne v2, v5, :cond_94

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_94

    move-object v4, v6

    :cond_94
    if-eqz v4, :cond_9c

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v3

    :cond_9a
    :goto_9a
    move v6, v3

    goto :goto_a7

    :cond_9c
    instance-of v2, v1, Lkj8;

    if-nez v2, :cond_9a

    iget-object v2, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v3

    goto :goto_9a

    :goto_a7
    move-object/from16 v18, v1

    check-cast v18, Lpkb;

    invoke-interface/range {v18 .. v18}, Lpkb;->getGroupId()I

    move-result v1

    if-eqz v1, :cond_e7

    invoke-interface/range {v18 .. v18}, Lpkb;->d()Z

    move-result v2

    if-nez v2, :cond_e7

    iget-object v2, v13, Loxj;->b:Lsxj;

    invoke-virtual {v2, v12}, Lsxj;->a(Z)I

    move-result v3

    invoke-virtual {v2, v12}, Lsxj;->b(Z)I

    move-result v4

    iget v5, v2, Lsxj;->b:I

    iget v2, v2, Lsxj;->d:I

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v19

    sub-int v19, v19, v3

    add-int v19, v19, v16

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int/2addr v3, v5

    add-int v3, v3, v17

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v5

    add-int/2addr v5, v4

    add-int v4, v5, v16

    invoke-virtual {v15}, Landroid/view/View;->getBottom()I

    move-result v5

    add-int/2addr v5, v2

    add-int v5, v5, v17

    move/from16 v2, v19

    invoke-virtual/range {v0 .. v6}, Lrkb;->f(IIIIIF)V

    :cond_e7
    if-eqz v1, :cond_10e

    invoke-interface/range {v18 .. v18}, Lpkb;->n()Z

    move-result v0

    if-eqz v0, :cond_10e

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v0

    add-int v2, v0, v16

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v0

    add-int v3, v0, v17

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v0

    add-int v4, v0, v16

    invoke-virtual {v15}, Landroid/view/View;->getBottom()I

    move-result v0

    add-int v5, v0, v17

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Lrkb;->f(IIIIIF)V

    goto/16 :goto_30

    :cond_10e
    move-object/from16 v0, p0

    goto/16 :goto_30

    :cond_112
    iget-object v1, v0, Lrkb;->g:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_11e
    :goto_11e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/high16 v6, 0x437f0000    # 255.0f

    if-eqz v5, :cond_152

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqkb;

    iget v9, v5, Lqkb;->b:I

    if-le v9, v11, :cond_11e

    iget-object v9, v0, Lrkb;->h:Landroid/graphics/drawable/Drawable;

    if-nez v9, :cond_135

    move-object v9, v4

    :cond_135
    iget v12, v5, Lqkb;->c:F

    mul-float/2addr v12, v6

    invoke-static {v12}, Lzed;->b(F)I

    move-result v6

    invoke-virtual {v9, v6}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v6, v0, Lrkb;->h:Landroid/graphics/drawable/Drawable;

    if-nez v6, :cond_144

    move-object v6, v4

    :cond_144
    iget-object v5, v5, Lqkb;->a:Landroid/graphics/Rect;

    invoke-virtual {v6, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v5, v0, Lrkb;->h:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_14e

    move-object v5, v4

    :cond_14e
    invoke-virtual {v5, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_11e

    :cond_152
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_15c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_172

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqkb;

    iget-object v5, v2, Lqkb;->a:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->setEmpty()V

    iput v10, v2, Lqkb;->b:I

    iput v3, v2, Lqkb;->c:F

    goto :goto_15c

    :cond_172
    new-instance v1, Lg6n;

    invoke-direct {v1, v8}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v2, v3

    :cond_17c
    :goto_17c
    move-object v5, v1

    check-cast v5, Lh6n;

    invoke-virtual {v5}, Lh6n;->hasNext()Z

    move-result v9

    iget-object v12, v0, Lrkb;->d:Lxh7;

    if-eqz v9, :cond_206

    invoke-virtual {v5}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    iget-object v9, v12, Lxh7;->c:Ljava/lang/Object;

    check-cast v9, Ljava/util/LinkedHashMap;

    invoke-virtual {v9, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/animation/ValueAnimator;

    if-eqz v9, :cond_1a6

    invoke-virtual {v9}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_1a6

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    goto :goto_1a7

    :cond_1a6
    move v9, v3

    :goto_1a7
    cmpl-float v12, v9, v3

    if-lez v12, :cond_17c

    iget-object v12, v0, Lrkb;->i:Landroid/graphics/drawable/Drawable;

    if-nez v12, :cond_1b0

    move-object v12, v4

    :cond_1b0
    mul-float v13, v9, v6

    invoke-static {v13}, Lzed;->b(F)I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v12, v0, Lrkb;->i:Landroid/graphics/drawable/Drawable;

    if-nez v12, :cond_1be

    move-object v12, v4

    :cond_1be
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v13

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v14

    invoke-static {v14}, Lzed;->b(F)I

    move-result v14

    add-int/2addr v14, v13

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v13

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v15

    invoke-static {v15}, Lzed;->b(F)I

    move-result v15

    add-int/2addr v15, v13

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v13

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v16

    invoke-static/range {v16 .. v16}, Lzed;->b(F)I

    move-result v16

    add-int v13, v16, v13

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v16

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v5

    invoke-static {v5}, Lzed;->b(F)I

    move-result v5

    add-int v5, v5, v16

    invoke-virtual {v12, v14, v15, v13, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v5, v0, Lrkb;->i:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_1fc

    move-object v5, v4

    :cond_1fc
    invoke-virtual {v5, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    cmpg-float v5, v2, v9

    if-gez v5, :cond_17c

    move v2, v9

    goto/16 :goto_17c

    :cond_206
    new-instance v1, Lg6n;

    invoke-direct {v1, v8}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_20f
    :goto_20f
    move-object v5, v1

    check-cast v5, Lh6n;

    invoke-virtual {v5}, Lh6n;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_273

    invoke-virtual {v5}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {v12, v5}, Lxh7;->a(Landroid/view/View;)F

    move-result v9

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v13, v2

    mul-float/2addr v13, v9

    cmpl-float v9, v13, v3

    if-lez v9, :cond_20f

    invoke-virtual {v8, v5}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v9

    iget-object v14, v0, Lrkb;->j:Landroid/graphics/drawable/Drawable;

    if-nez v14, :cond_233

    move-object v14, v4

    :cond_233
    instance-of v15, v9, Lpkb;

    if-eqz v15, :cond_241

    check-cast v9, Lpkb;

    invoke-interface {v9}, Lpkb;->getGroupId()I

    move-result v9

    if-eqz v9, :cond_241

    move v9, v11

    goto :goto_242

    :cond_241
    move v9, v10

    :goto_242
    invoke-virtual {v14, v9}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    iget-object v9, v0, Lrkb;->j:Landroid/graphics/drawable/Drawable;

    if-nez v9, :cond_24a

    move-object v9, v4

    :cond_24a
    mul-float/2addr v13, v6

    invoke-static {v13}, Lzed;->b(F)I

    move-result v13

    invoke-virtual {v9, v13}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v9, v0, Lrkb;->j:Landroid/graphics/drawable/Drawable;

    if-nez v9, :cond_257

    move-object v9, v4

    :cond_257
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v13

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v14

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v15

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v5

    invoke-virtual {v9, v13, v14, v15, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v5, v0, Lrkb;->j:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_26f

    move-object v5, v4

    :cond_26f
    invoke-virtual {v5, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_20f

    :cond_273
    iget-object v0, v0, Lrkb;->k:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2e4

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v3, v2

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    sub-int/2addr v4, v11

    :cond_28b
    :goto_28b
    if-ge v10, v4, :cond_2e4

    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v8, v5}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v9

    invoke-virtual {v8, v6}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v11

    instance-of v12, v9, Lpkb;

    if-eqz v12, :cond_28b

    instance-of v12, v11, Lpkb;

    if-eqz v12, :cond_28b

    check-cast v9, Lpkb;

    invoke-interface {v9}, Lpkb;->getGroupId()I

    move-result v12

    check-cast v11, Lpkb;

    invoke-interface {v11}, Lpkb;->getGroupId()I

    move-result v13

    if-ne v12, v13, :cond_28b

    invoke-interface {v9}, Lpkb;->k()Ljava/lang/Class;

    move-result-object v12

    invoke-interface {v11}, Lpkb;->k()Ljava/lang/Class;

    move-result-object v11

    invoke-static {v12, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_28b

    invoke-interface {v9}, Lpkb;->k()Ljava/lang/Class;

    move-result-object v9

    if-eqz v9, :cond_28b

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v9

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v5

    sub-int/2addr v6, v5

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v9

    add-int v5, v6, v1

    add-int v9, v3, v2

    invoke-virtual {v0, v6, v3, v5, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_28b

    :cond_2e4
    return-void
.end method
