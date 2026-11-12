.class public final Lbx8;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lnue;

.field public final d:Lkue;

.field public final e:Lx5f;

.field public final f:Lx5f;

.field public final g:Lumi;

.field public final h:Lcq5;

.field public final i:Lcom/opera/android/settings/SettingsManager;

.field public final j:Lfqe;

.field public final k:Lqie;

.field public final l:Landroid/view/View$OnLongClickListener;

.field public final m:Lhx8;

.field public final n:Lu37;

.field public final o:Lisd;

.field public final p:Lkze;

.field public final q:Lqq6;

.field public final r:Lpde;

.field public s:Z

.field public t:Z

.field public u:I


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnue;Lkue;Lx5f;Lx5f;Lumi;Lcq5;Lcom/opera/android/settings/SettingsManager;Lfqe;Lqie;Landroid/view/View$OnLongClickListener;Lkze;Lqq6;Lpde;)V
    .registers 17

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lbx8;->a:Ljava/util/ArrayList;

    new-instance v0, Lu37;

    new-instance v1, Lyw8;

    invoke-direct {v1, p0}, Lyw8;-><init>(Lbx8;)V

    invoke-direct {v0, v1}, Lu37;-><init>(Lt37;)V

    iput-object v0, p0, Lbx8;->n:Lu37;

    new-instance v0, Lisd;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lisd;-><init>(B)V

    iput-object v0, p0, Lbx8;->o:Lisd;

    iput-object p1, p0, Lbx8;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lbx8;->c:Lnue;

    iput-object p3, p0, Lbx8;->d:Lkue;

    iput-object p4, p0, Lbx8;->e:Lx5f;

    iput-object p5, p0, Lbx8;->f:Lx5f;

    iput-object p6, p0, Lbx8;->g:Lumi;

    iput-object p7, p0, Lbx8;->h:Lcq5;

    iput-object p8, p0, Lbx8;->i:Lcom/opera/android/settings/SettingsManager;

    iput-object p9, p0, Lbx8;->j:Lfqe;

    iput-object p10, p0, Lbx8;->k:Lqie;

    iput-object p11, p0, Lbx8;->l:Landroid/view/View$OnLongClickListener;

    new-instance p2, Lhx8;

    new-instance p3, Lyw8;

    invoke-direct {p3, p0}, Lyw8;-><init>(Lbx8;)V

    invoke-direct {p2, p1, p3}, Lhx8;-><init>(Lcom/opera/android/BrowserActivity;Lyw8;)V

    iput-object p2, p0, Lbx8;->m:Lhx8;

    iput-object p12, p0, Lbx8;->p:Lkze;

    iput-object p13, p0, Lbx8;->q:Lqq6;

    move-object/from16 p1, p14

    iput-object p1, p0, Lbx8;->r:Lpde;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)I
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1f

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzw8;

    iget-object v1, v1, Lzw8;->a:Lbwf;

    invoke-virtual {v1}, Lbwf;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    return v0

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1f
    const/4 p0, -0x1

    return p0
.end method

.method public final b(IZ)V
    .registers 3

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzw8;

    iget-object p0, p0, Lzw8;->b:Lxw8;

    if-eqz p0, :cond_10

    iget-boolean p1, p0, Lxw8;->D:Z

    if-ne p1, p2, :cond_11

    :cond_10
    return-void

    :cond_11
    invoke-virtual {p0, p2}, Lxw8;->k(Z)V

    return-void
.end method

.method public final destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 9

    check-cast p3, Lzw8;

    iget-object v0, p3, Lzw8;->b:Lxw8;

    invoke-virtual {v0}, Lxw8;->f()Landroid/util/SparseArray;

    move-result-object v1

    iput-object v1, p3, Lzw8;->c:Landroid/util/SparseArray;

    const/4 v1, 0x0

    iput-object v1, p3, Lzw8;->b:Lxw8;

    iget-object v2, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    invoke-virtual {v0, v3}, Lxw8;->c(Z)V

    iget-object v0, v0, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p1, p3, Lzw8;->a:Lbwf;

    iget-object p3, p0, Lbx8;->m:Lhx8;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lbwf;->a()Ljava/lang/String;

    move-result-object p1

    const-string v0, "topnews"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_33

    invoke-virtual {p3, v1}, Lhx8;->c(Lbwf;)V

    :cond_33
    iget p1, p0, Lbx8;->u:I

    if-ne p1, p2, :cond_42

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_42

    iget p1, p0, Lbx8;->u:I

    invoke-virtual {p0, p1, v4}, Lbx8;->b(IZ)V

    :cond_42
    return-void
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemPosition(Ljava/lang/Object;)I
    .registers 2

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    check-cast p1, Lzw8;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-gez p0, :cond_b

    const/4 p0, -0x2

    :cond_b
    return p0
.end method

.method public final getPageTitle(I)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzw8;

    iget-object p0, p0, Lzw8;->a:Lbwf;

    invoke-virtual {p0}, Lbwf;->b()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    move/from16 v1, p2

    iget-object v2, v0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzw8;

    iget-object v10, v2, Lzw8;->c:Landroid/util/SparseArray;

    const/4 v3, 0x0

    iput-object v3, v2, Lzw8;->c:Landroid/util/SparseArray;

    new-instance v3, Lxw8;

    iget-object v8, v2, Lzw8;->a:Lbwf;

    const/4 v4, 0x1

    if-nez v1, :cond_1a

    move v9, v4

    goto :goto_1c

    :cond_1a
    const/4 v5, 0x0

    move v9, v5

    :goto_1c
    iget-object v5, v0, Lbx8;->q:Lqq6;

    iget-object v6, v0, Lbx8;->r:Lpde;

    iget-object v4, v0, Lbx8;->b:Lcom/opera/android/BrowserActivity;

    move-object/from16 v22, v5

    iget-object v5, v0, Lbx8;->c:Lnue;

    move-object/from16 v23, v6

    iget-object v6, v0, Lbx8;->d:Lkue;

    iget-object v11, v0, Lbx8;->n:Lu37;

    iget-object v12, v0, Lbx8;->o:Lisd;

    iget-object v13, v0, Lbx8;->e:Lx5f;

    iget-object v14, v0, Lbx8;->f:Lx5f;

    iget-object v15, v0, Lbx8;->g:Lumi;

    iget-object v7, v0, Lbx8;->h:Lcq5;

    move-object/from16 v17, v3

    iget-object v3, v0, Lbx8;->i:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v18, v3

    iget-object v3, v0, Lbx8;->j:Lfqe;

    move-object/from16 v19, v3

    iget-object v3, v0, Lbx8;->k:Lqie;

    move-object/from16 v20, v3

    iget-object v3, v0, Lbx8;->l:Landroid/view/View$OnLongClickListener;

    move-object/from16 v21, v3

    iget-object v3, v0, Lbx8;->p:Lkze;

    move-object/from16 v16, v21

    move-object/from16 v21, v3

    move-object/from16 v3, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v16

    move-object/from16 v16, v7

    move-object/from16 v7, p1

    invoke-direct/range {v3 .. v23}, Lxw8;-><init>(Lcom/opera/android/BrowserActivity;Lnue;Lkue;Landroid/view/ViewGroup;Lbwf;ZLandroid/util/SparseArray;Lu37;Lisd;Lx5f;Lx5f;Lumi;Lcq5;Lcom/opera/android/settings/SettingsManager;Lfqe;Lqie;Landroid/view/View$OnLongClickListener;Lkze;Lqq6;Lpde;)V

    iput-object v3, v2, Lzw8;->b:Lxw8;

    iget-object v4, v3, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v4, v2, Lzw8;->a:Lbwf;

    iget-object v5, v0, Lbx8;->m:Lhx8;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Lbwf;->a()Ljava/lang/String;

    move-result-object v6

    const-string v7, "topnews"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7c

    invoke-virtual {v5, v4}, Lhx8;->c(Lbwf;)V

    :cond_7c
    iget v4, v0, Lbx8;->u:I

    const/4 v7, 0x1

    if-ne v4, v1, :cond_84

    invoke-virtual {v3, v7}, Lxw8;->k(Z)V

    :cond_84
    iget-boolean v1, v0, Lbx8;->s:Z

    if-eqz v1, :cond_8b

    invoke-virtual {v3, v7}, Lxw8;->i(Z)V

    :cond_8b
    iget-boolean v0, v0, Lbx8;->t:Z

    if-eqz v0, :cond_a2

    iput-boolean v7, v3, Lxw8;->C:Z

    invoke-virtual {v3}, Lxw8;->d()V

    new-instance v0, Lix8;

    iget-boolean v1, v3, Lxw8;->D:Z

    iget-boolean v4, v3, Lxw8;->C:Z

    invoke-direct {v0, v1, v4}, Lix8;-><init>(ZZ)V

    iget-object v1, v3, Lxw8;->h:Low8;

    invoke-virtual {v1, v0}, Lha2;->b(Lsjm;)V

    :cond_a2
    return-object v2
.end method

.method public final isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 3

    check-cast p2, Lzw8;

    iget-object p0, p2, Lzw8;->b:Lxw8;

    if-eqz p0, :cond_10

    iget-object p0, p0, Lxw8;->a:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V
    .registers 9

    const/4 p2, 0x0

    const/4 v0, 0x0

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    if-nez p1, :cond_29

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v1, v0

    :goto_b
    if-ge v1, p1, :cond_73

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lzw8;

    iget-object v3, v2, Lzw8;->b:Lxw8;

    if-eqz v3, :cond_26

    iput-object p2, v3, Lxw8;->A:Landroid/util/SparseArray;

    iget-object v2, v3, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    iget-object v2, v3, Lxw8;->h:Low8;

    invoke-virtual {v2, p2}, Lha2;->I(Lu0g;)V

    goto :goto_b

    :cond_26
    iput-object p2, v2, Lzw8;->c:Landroid/util/SparseArray;

    goto :goto_b

    :cond_29
    instance-of v1, p1, Lax8;

    if-eqz v1, :cond_73

    check-cast p1, Lax8;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v0

    :cond_34
    :goto_34
    if-ge v2, v1, :cond_73

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lzw8;

    iget-object v4, v3, Lzw8;->a:Lbwf;

    invoke-virtual {v4}, Lbwf;->a()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Lax8;->a:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/SparseArray;

    iget-object v5, v3, Lzw8;->b:Lxw8;

    if-nez v4, :cond_62

    if-eqz v5, :cond_5f

    iput-object p2, v5, Lxw8;->A:Landroid/util/SparseArray;

    iget-object v3, v5, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    iget-object v3, v5, Lxw8;->h:Low8;

    invoke-virtual {v3, p2}, Lha2;->I(Lu0g;)V

    goto :goto_34

    :cond_5f
    iput-object p2, v3, Lzw8;->c:Landroid/util/SparseArray;

    goto :goto_34

    :cond_62
    if-nez v5, :cond_67

    iput-object v4, v3, Lzw8;->c:Landroid/util/SparseArray;

    goto :goto_34

    :cond_67
    iput-object v4, v5, Lxw8;->A:Landroid/util/SparseArray;

    iget-object v3, v5, Lxw8;->i:Lrw8;

    iget-boolean v3, v3, Lrw8;->e:Z

    if-eqz v3, :cond_34

    invoke-virtual {v5}, Lxw8;->a()V

    goto :goto_34

    :cond_73
    return-void
.end method

.method public final saveState()Landroid/os/Parcelable;
    .registers 2

    new-instance v0, Lax8;

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Lax8;-><init>(Ljava/util/ArrayList;)V

    return-object v0
.end method
