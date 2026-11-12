.class public final Lnte;
.super Ltx7;
.source "SourceFile"


# instance fields
.field public e:Lote;

.field public f:Z

.field public final synthetic g:Lpte;


# direct methods
.method public constructor <init>(Lpte;)V
    .registers 2

    iput-object p1, p0, Lnte;->g:Lpte;

    invoke-direct {p0}, Ltx7;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Ltx7;->a:Z

    return-void
.end method


# virtual methods
.method public final f(I)I
    .registers 13

    iget-boolean v0, p0, Lnte;->f:Z

    iget-object v1, p0, Lnte;->g:Lpte;

    if-nez v0, :cond_c8

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnte;->f:Z

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, v1, Lpte;->w:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_24

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcwf;

    iput v5, v4, Lcwf;->e:I

    goto :goto_14

    :cond_24
    move v3, v5

    move v4, v3

    :goto_26
    iget-object v6, v1, Lpte;->w:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_c8

    iget-object v6, v1, Lpte;->w:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcwf;

    invoke-virtual {p0, v3}, Lnte;->i(I)I

    move-result v7

    const/4 v8, 0x2

    const/4 v9, 0x6

    if-ne v7, v0, :cond_40

    move v7, v8

    goto :goto_4e

    :cond_40
    const/4 v10, 0x3

    if-ne v7, v10, :cond_45

    const/4 v7, 0x4

    goto :goto_4e

    :cond_45
    const/4 v10, 0x5

    if-ne v7, v10, :cond_4a

    move v7, v9

    goto :goto_4e

    :cond_4a
    invoke-static {v9, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    :goto_4e
    iput v7, v6, Lcwf;->e:I

    add-int/2addr v7, v4

    if-gt v7, v9, :cond_5a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5a
    iget v7, v6, Lcwf;->e:I

    add-int/2addr v4, v7

    iget-object v7, v1, Lpte;->w:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v0

    if-ne v3, v7, :cond_68

    move v7, v0

    goto :goto_69

    :cond_68
    move v7, v5

    :goto_69
    if-ge v4, v9, :cond_6d

    if-eqz v7, :cond_c4

    :cond_6d
    if-nez v7, :cond_8d

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v0, :cond_80

    iget v7, v6, Lcwf;->e:I

    if-eq v7, v9, :cond_80

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_80
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v8, :cond_9d

    if-eq v4, v9, :cond_9d

    invoke-virtual {p0, v2}, Lnte;->j(Ljava/util/ArrayList;)I

    move-result v4

    goto :goto_aa

    :cond_8d
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-gtz v4, :cond_9f

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9f

    :cond_9d
    move v4, v5

    goto :goto_aa

    :cond_9f
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v2}, Lnte;->j(Ljava/util/ArrayList;)I

    move-result v4

    :goto_aa
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c1

    iget v4, v6, Lcwf;->e:I

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c4

    :cond_c1
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    :cond_c4
    :goto_c4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_26

    :cond_c8
    iget-object p0, v1, Lpte;->w:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcwf;

    iget p0, p0, Lcwf;->e:I

    return p0
.end method

.method public final h()V
    .registers 2

    invoke-super {p0}, Ltx7;->h()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnte;->f:Z

    return-void
.end method

.method public final i(I)I
    .registers 8

    iget-object v0, p0, Lnte;->g:Lpte;

    iget-object v1, v0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iget-object v2, v0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, v0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    if-gtz v1, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    div-int/lit8 v1, v1, 0x6

    iget-object v2, v0, Lpte;->w:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcwf;

    iget v3, v2, Lcwf;->d:I

    if-nez v3, :cond_4f

    iget-object v3, p0, Lnte;->e:Lote;

    const/4 v4, 0x0

    if-nez v3, :cond_39

    iget-object v3, v0, Lpte;->y:Lx93;

    iget-object v5, v0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v3, v5, v4}, Landroidx/recyclerview/widget/d;->createViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;

    move-result-object v3

    check-cast v3, Lote;

    iput-object v3, p0, Lnte;->e:Lote;

    :cond_39
    iget-object v0, v0, Lpte;->y:Lx93;

    invoke-virtual {v0, v3, p1}, Lx93;->J(Lote;I)V

    iget-object p1, p0, Lnte;->e:Lote;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, v4, v4}, Landroid/view/View;->measure(II)V

    iget-object p0, p0, Lnte;->e:Lote;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    iput v3, v2, Lcwf;->d:I

    :cond_4f
    int-to-float p0, v3

    int-to-float p1, v1

    div-float/2addr p0, p1

    float-to-double p0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p0

    double-to-int p0, p0

    return p0
.end method

.method public final j(Ljava/util/ArrayList;)I
    .registers 12

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x6

    div-int v2, v1, v0

    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v1

    :cond_10
    :goto_10
    if-ge v4, v3, :cond_6b

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0, v7}, Lnte;->i(I)I

    move-result v7

    iget-object v8, p0, Lnte;->g:Lpte;

    iget-object v9, v8, Lpte;->w:Ljava/util/List;

    if-le v7, v2, :cond_5d

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcwf;

    iget v7, v7, Lcwf;->e:I

    iget-object v8, v8, Lpte;->w:Ljava/util/List;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcwf;

    const/4 v8, 0x1

    add-int/2addr v7, v8

    if-ne v7, v8, :cond_46

    const/4 v7, 0x2

    goto :goto_54

    :cond_46
    const/4 v8, 0x3

    if-ne v7, v8, :cond_4b

    const/4 v7, 0x4

    goto :goto_54

    :cond_4b
    const/4 v8, 0x5

    if-ne v7, v8, :cond_50

    move v7, v1

    goto :goto_54

    :cond_50
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    :goto_54
    iput v7, v6, Lcwf;->e:I

    add-int/lit8 v0, v0, -0x1

    if-lez v0, :cond_10

    div-int v2, v1, v0

    goto :goto_10

    :cond_5d
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcwf;

    iput v2, v6, Lcwf;->e:I

    sub-int/2addr v5, v2

    goto :goto_10

    :cond_6b
    return v5
.end method
