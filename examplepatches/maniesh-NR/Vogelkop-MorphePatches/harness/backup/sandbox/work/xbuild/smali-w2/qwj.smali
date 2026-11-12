.class public final Lqwj;
.super Ltx7;
.source "SourceFile"


# instance fields
.field public final e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Lro9;

.field public final g:Low8;

.field public final h:Lisd;

.field public final i:B


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Low8;Lisd;I)V
    .registers 5

    invoke-direct {p0}, Ltx7;-><init>()V

    iput-object p1, p0, Lqwj;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/g;->c()Lro9;

    move-result-object p1

    iput-object p1, p0, Lqwj;->f:Lro9;

    iput-object p2, p0, Lqwj;->g:Low8;

    iput-object p3, p0, Lqwj;->h:Lisd;

    iput-byte p4, p0, Lqwj;->i:B

    return-void
.end method


# virtual methods
.method public final f(I)I
    .registers 9

    iget-object v0, p0, Lqwj;->g:Low8;

    invoke-virtual {v0, p1}, Lha2;->getItemViewType(I)I

    move-result p1

    iget-object v1, p0, Lqwj;->h:Lisd;

    iget-object v2, v1, Lisd;->b:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseIntArray;

    const/4 v3, -0x2

    invoke-virtual {v2, p1, v3}, Landroid/util/SparseIntArray;->get(II)I

    move-result v2

    if-ne v2, v3, :cond_75

    const/4 v2, 0x0

    move v3, v2

    :goto_15
    iget-object v4, p0, Lqwj;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_30

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v5

    if-eqz v5, :cond_2d

    invoke-virtual {v5}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result v6

    if-eq v6, p1, :cond_31

    :cond_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_30
    const/4 v5, 0x0

    :cond_31
    iget-object v3, p0, Lqwj;->f:Lro9;

    const/4 v6, 0x1

    if-nez v5, :cond_3c

    :try_start_36
    invoke-virtual {v3, p1}, Lro9;->t(I)Landroidx/recyclerview/widget/i;

    move-result-object v2

    move-object v5, v2

    move v2, v6

    :cond_3c
    if-nez v5, :cond_47

    invoke-virtual {v0, v4, p1}, Landroidx/recyclerview/widget/d;->createViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;

    move-result-object v0
    :try_end_42
    .catchall {:try_start_36 .. :try_end_42} :catchall_45

    move-object v5, v0

    move v2, v6

    goto :goto_47

    :catchall_45
    move-exception p0

    goto :goto_6d

    :cond_47
    :goto_47
    :try_start_47
    instance-of v0, v5, Lab2;
    :try_end_49
    .catchall {:try_start_47 .. :try_end_49} :catchall_6b

    if-nez v0, :cond_54

    if-eqz v5, :cond_52

    if-eqz v2, :cond_52

    invoke-virtual {v3, v5}, Lro9;->F(Landroidx/recyclerview/widget/i;)V

    :cond_52
    move v2, v6

    goto :goto_63

    :cond_54
    :try_start_54
    move-object v0, v5

    check-cast v0, Lab2;

    invoke-virtual {v0}, Lab2;->U()I

    move-result v0
    :try_end_5b
    .catchall {:try_start_54 .. :try_end_5b} :catchall_6b

    if-eqz v5, :cond_62

    if-eqz v2, :cond_62

    invoke-virtual {v3, v5}, Lro9;->F(Landroidx/recyclerview/widget/i;)V

    :cond_62
    move v2, v0

    :goto_63
    iget-object v0, v1, Lisd;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_75

    :catchall_6b
    move-exception p0

    move v6, v2

    :goto_6d
    if-eqz v5, :cond_74

    if-eqz v6, :cond_74

    invoke-virtual {v3, v5}, Lro9;->F(Landroidx/recyclerview/widget/i;)V

    :cond_74
    throw p0

    :cond_75
    :goto_75
    const/4 p1, -0x1

    if-ne v2, p1, :cond_7b

    iget-byte p0, p0, Lqwj;->i:B

    return p0

    :cond_7b
    return v2
.end method
