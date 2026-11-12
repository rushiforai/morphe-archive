.class public abstract Liu8;
.super Lba2;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Luqe;

.field public final d:Lp12;

.field public final e:Lx79;

.field public final f:Ljava/lang/String;

.field public final g:Lp0c;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lxw8;Luqe;Lp12;Lx79;)V
    .registers 12

    const-class v0, Lpue;

    invoke-direct {p0, v0}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Liu8;->b:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Liu8;->c:Luqe;

    iput-object p4, p0, Liu8;->d:Lp12;

    iput-object p5, p0, Liu8;->e:Lx79;

    iget-object p3, p2, Lxw8;->b:Lbwf;

    invoke-virtual {p3}, Lbwf;->a()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Liu8;->f:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object p3

    iget-object p3, p3, Ldyf;->b:Lay;

    invoke-virtual {p3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lp0c;

    iput-object p3, p0, Liu8;->g:Lp0c;

    iget-object v2, p2, Lxw8;->y:Ls9i;

    iget-object v3, p2, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lxoi;

    new-instance v4, Lvx;

    const/16 p0, 0x13

    invoke-direct {v4, p2, p0}, Lvx;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lhu8;

    invoke-direct {v5, p2}, Lhu8;-><init>(Lxw8;)V

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lxoi;-><init>(Landroid/content/Context;Ls9i;Landroidx/recyclerview/widget/RecyclerView;Lvx;Lhu8;)V

    return-void
.end method


# virtual methods
.method public final b(Lsjm;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lix8;

    iget-boolean v2, v1, Lix8;->c:Z

    const/4 v3, 0x0

    iget-object v4, v0, Liu8;->d:Lp12;

    if-eqz v2, :cond_f6

    iget-boolean v1, v1, Lsjm;->a:Z

    if-eqz v1, :cond_f5

    iget-object v0, v0, Liu8;->e:Lx79;

    if-eqz v0, :cond_f2

    iget-object v1, v0, Lx79;->e:Ljava/lang/Object;

    check-cast v1, Luqe;

    iget-object v1, v1, Luqe;->t:Lbch;

    iget-object v2, v1, Lbch;->c:Lmsh;

    iput-object v3, v1, Lbch;->c:Lmsh;

    if-eqz v2, :cond_f2

    iget-object v1, v0, Lx79;->b:Ljava/lang/Object;

    check-cast v1, Low8;

    iget-object v5, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    move v8, v7

    move v9, v8

    :goto_2e
    const/4 v10, -0x1

    if-ge v9, v6, :cond_4a

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v9, v9, 0x1

    check-cast v11, Lja2;

    instance-of v12, v11, Lj82;

    if-eqz v12, :cond_47

    check-cast v11, Lj82;

    iget-object v11, v11, Lj82;->c:Loqe;

    invoke-virtual {v11, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_4b

    :cond_47
    add-int/lit8 v8, v8, 0x1

    goto :goto_2e

    :cond_4a
    move v8, v10

    :cond_4b
    const/4 v5, 0x1

    if-gez v8, :cond_e5

    iget-object v6, v0, Lx79;->a:Ljava/lang/Object;

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v6, v6, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v8, v6, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v8, :cond_5f

    check-cast v6, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v6}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v10

    goto :goto_b0

    :cond_5f
    instance-of v8, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    if-eqz v8, :cond_b0

    check-cast v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    iget v8, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a:I

    new-array v9, v8, [I

    move v10, v7

    :goto_6a
    iget v11, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a:I

    if-ge v10, v11, :cond_a0

    iget-object v11, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b:[Ldqj;

    aget-object v12, v11, v10

    iget-object v11, v12, Ldqj;->f:Ljava/lang/Object;

    check-cast v11, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    iget-boolean v11, v11, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->h:Z

    iget-object v13, v12, Ldqj;->a:Ljava/util/ArrayList;

    if-eqz v11, :cond_8d

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/lit8 v14, v11, -0x1

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/4 v13, 0x1

    const/4 v15, -0x1

    invoke-virtual/range {v12 .. v17}, Ldqj;->h(ZIIZZ)I

    move-result v11

    goto :goto_9b

    :cond_8d
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v15

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x0

    invoke-virtual/range {v12 .. v17}, Ldqj;->h(ZIIZZ)I

    move-result v11

    :goto_9b
    aput v11, v9, v10

    add-int/lit8 v10, v10, 0x1

    goto :goto_6a

    :cond_a0
    const v6, 0x7fffffff

    move v10, v6

    move v6, v7

    :goto_a5
    if-ge v6, v8, :cond_b0

    aget v11, v9, v6

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    add-int/lit8 v6, v6, 0x1

    goto :goto_a5

    :cond_b0
    :goto_b0
    if-ltz v10, :cond_f2

    move v8, v10

    :goto_b3
    iget-object v6, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v8, v6, :cond_d1

    invoke-virtual {v1, v8}, Lha2;->J(I)Lja2;

    move-result-object v6

    instance-of v6, v6, Lj82;

    if-eqz v6, :cond_ce

    invoke-virtual {v1, v8}, Lha2;->J(I)Lja2;

    move-result-object v3

    check-cast v3, Lj82;

    check-cast v3, Lpue;

    iget-object v3, v3, Lj82;->c:Loqe;

    goto :goto_d1

    :cond_ce
    add-int/lit8 v8, v8, 0x1

    goto :goto_b3

    :cond_d1
    :goto_d1
    if-eqz v3, :cond_f2

    iget-object v6, v0, Lx79;->c:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-static {v2, v6, v7}, Lpue;->e(Loqe;Ljava/lang/String;Z)Lpue;

    move-result-object v6

    invoke-virtual {v1, v8, v6}, Lha2;->H(ILja2;)V

    iget-object v0, v0, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e5
    invoke-static {v2}, Lp12;->h(Loqe;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_f2

    invoke-virtual {v4, v2, v0, v8, v5}, Lp12;->l(Loqe;Ljava/util/ArrayList;IZ)V

    :cond_f2
    invoke-virtual {v4}, Lp12;->x()V

    :cond_f5
    return-void

    :cond_f6
    iput-object v3, v4, Lp12;->f:Ljava/lang/Object;

    return-void
.end method

.method public final d(ILjava/util/ArrayList;)V
    .registers 9

    iget-object v0, p0, Liu8;->e:Lx79;

    if-eqz v0, :cond_39

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_a
    if-lt v1, p1, :cond_39

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lja2;

    instance-of v3, v2, Lj82;

    if-eqz v3, :cond_36

    check-cast v2, Lj82;

    check-cast v2, Lpue;

    iget-object v2, v2, Lj82;->c:Loqe;

    iget-object v3, v0, Lx79;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Loqe;

    if-eqz v2, :cond_36

    iget-object v3, v0, Lx79;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    check-cast v2, Lmsh;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lpue;->e(Loqe;Ljava/lang/String;Z)Lpue;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_36
    add-int/lit8 v1, v1, -0x1

    goto :goto_a

    :cond_39
    check-cast p0, Lvue;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_41
    if-lt v0, p1, :cond_80

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lja2;

    instance-of v2, v1, Lj82;

    if-eqz v2, :cond_7d

    check-cast v1, Lj82;

    check-cast v1, Lpue;

    iget-object v1, v1, Lj82;->c:Loqe;

    instance-of v2, v1, Lmsh;

    if-eqz v2, :cond_5a

    check-cast v1, Lmsh;

    goto :goto_5b

    :cond_5a
    const/4 v1, 0x0

    :goto_5b
    if-eqz v1, :cond_7d

    invoke-static {v1}, Lp12;->h(Loqe;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7d

    iget-object v3, v1, Lmsh;->A:Lkm5;

    iget-boolean v3, v3, Lkm5;->b:Z

    if-eqz v3, :cond_80

    add-int/lit8 v3, v0, 0x1

    iget-object v4, p0, Liu8;->d:Lp12;

    iget-object v4, v4, Lp12;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    new-instance v5, Lfve;

    invoke-direct {v5, v1, v2, v4}, Lfve;-><init>(Loqe;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p2, v3, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_7d
    add-int/lit8 v0, v0, -0x1

    goto :goto_41

    :cond_80
    return-void
.end method

.method public final v()V
    .registers 2

    iget-object p0, p0, Liu8;->d:Lp12;

    const/4 v0, 0x0

    iput-object v0, p0, Lp12;->f:Ljava/lang/Object;

    return-void
.end method
