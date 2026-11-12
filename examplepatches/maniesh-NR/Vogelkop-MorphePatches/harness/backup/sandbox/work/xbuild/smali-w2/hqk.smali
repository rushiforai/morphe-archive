.class public final Lhqk;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Liqk;
.implements Ljvk;


# instance fields
.field public A:Lpvb;

.field public B:Z

.field public final a:Lfe5;

.field public final b:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public final c:Ls28;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Lipk;

.field public final f:Lx5f;

.field public final g:Losf;

.field public final h:Lx5f;

.field public final i:Lcbf;

.field public final j:Z

.field public final k:Lwjh;

.field public final l:Lqr8;

.field public final m:Lnv2;

.field public final n:Lpde;

.field public final o:Lhw3;

.field public final p:Leek;

.field public q:Ljava/lang/String;

.field public final r:Ll5b;

.field public final s:Ljava/util/ArrayList;

.field public final t:Lb5a;

.field public final u:Lnv6;

.field public final v:Lz61;

.field public final w:Lmvk;

.field public x:Liqk;

.field public y:Ljava/util/List;

.field public z:Z


# direct methods
.method public constructor <init>(Lfe5;Lcom/opera/android/custom_views/FadingRecyclerView;Ls28;Lcom/opera/android/settings/SettingsManager;Lipk;Lx5f;Losf;Lx5f;Lqdh;Lbr6;Lcbf;ILwjh;Lqr8;Lnv2;Lpde;Lhw3;Leek;)V
    .registers 30

    move-object/from16 v0, p5

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    move-object/from16 v3, p8

    move-object/from16 v4, p9

    move/from16 v5, p12

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p1, p0, Lhqk;->a:Lfe5;

    iput-object p2, p0, Lhqk;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object p3, p0, Lhqk;->c:Ls28;

    iput-object p4, p0, Lhqk;->d:Lcom/opera/android/settings/SettingsManager;

    iput-object v0, p0, Lhqk;->e:Lipk;

    iput-object v1, p0, Lhqk;->f:Lx5f;

    iput-object v2, p0, Lhqk;->g:Losf;

    iput-object v3, p0, Lhqk;->h:Lx5f;

    move-object/from16 p1, p11

    iput-object p1, p0, Lhqk;->i:Lcbf;

    iput-boolean v5, p0, Lhqk;->j:Z

    move-object/from16 p1, p13

    iput-object p1, p0, Lhqk;->k:Lwjh;

    move-object/from16 p1, p14

    iput-object p1, p0, Lhqk;->l:Lqr8;

    move-object/from16 p1, p15

    iput-object p1, p0, Lhqk;->m:Lnv2;

    move-object/from16 p1, p16

    iput-object p1, p0, Lhqk;->n:Lpde;

    move-object/from16 p1, p17

    iput-object p1, p0, Lhqk;->o:Lhw3;

    move-object/from16 p1, p18

    iput-object p1, p0, Lhqk;->p:Leek;

    const-string p1, ""

    iput-object p1, p0, Lhqk;->q:Ljava/lang/String;

    new-instance p1, Ll5b;

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ne v5, v7, :cond_49

    move v8, v7

    goto :goto_4a

    :cond_49
    move v8, v6

    :goto_4a
    const/16 v9, 0x9

    invoke-direct {p1, v9, v8}, Ll5b;-><init>(BZ)V

    iput-object p1, p0, Lhqk;->r:Ll5b;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lhqk;->s:Ljava/util/ArrayList;

    new-instance p1, Lz61;

    const/16 v8, 0x17

    invoke-direct {p1, p0, v8}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lhqk;->v:Lz61;

    const p1, 0x7f14056b

    invoke-static {p1}, Lnvk;->v(I)Lmvk;

    move-result-object p1

    iput-object p1, p0, Lhqk;->w:Lmvk;

    sget-object p1, Liqk;->Bp:Lioj;

    iput-object p1, p0, Lhqk;->x:Liqk;

    new-instance p1, Ljava/util/HashSet;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, v7}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lhqk;->y:Ljava/util/List;

    new-instance p1, Lb5a;

    if-ne v5, v7, :cond_7d

    move v5, v7

    goto :goto_7e

    :cond_7d
    move v5, v6

    :goto_7e
    new-instance v8, Lu7k;

    invoke-direct {v8, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    const v9, 0x7f0402a0

    const/4 v10, 0x1

    move-object/from16 p11, p1

    move-object/from16 p12, p2

    move/from16 p13, v5

    move-object/from16 p14, v8

    move/from16 p15, v9

    move/from16 p16, v10

    invoke-direct/range {p11 .. p16}, Lb5a;-><init>(Landroidx/recyclerview/widget/RecyclerView;ZLa5a;IZ)V

    iput-object p1, p0, Lhqk;->t:Lb5a;

    iget-object p1, v0, Lipk;->a:Lxbf;

    iget-object p1, p1, Lxbf;->d:Ljava/lang/Object;

    check-cast p1, Lh42;

    new-instance p2, Lqzg;

    const/16 v0, 0x19

    invoke-direct {p2, p0, v0}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    new-instance p1, Lole;

    invoke-direct {p1, v2}, Lole;-><init>(Ljava/lang/Object;)V

    new-instance p2, Lnv6;

    new-instance v2, Lwqi;

    invoke-direct {v2, v4}, Lwqi;-><init>(Lqdh;)V

    new-instance v5, Landroid/util/SparseArray;

    const/4 v8, 0x7

    invoke-direct {v5, v8}, Landroid/util/SparseArray;-><init>(I)V

    new-instance v8, Lwk3;

    invoke-direct {v8, v1}, Lwk3;-><init>(Lx5f;)V

    const/16 v9, 0x10

    invoke-virtual {v5, v9, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance v8, Lxu4;

    invoke-direct {v8, p1}, Lxu4;-><init>(Lole;)V

    const/16 p1, 0x11

    invoke-virtual {v5, p1, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/16 p1, 0x15

    invoke-virtual {v5, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/16 p1, 0x16

    invoke-virtual {v5, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p1, Lxu4;

    invoke-direct {p1, v3, v6}, Lxu4;-><init>(Lx5f;B)V

    invoke-virtual {v5, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p1, Li3h;

    invoke-direct {p1, v1}, Li3h;-><init>(Lx5f;)V

    const/16 v0, 0x20

    invoke-virtual {v5, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p1, Lxu4;

    invoke-direct {p1, v1, v7}, Lxu4;-><init>(Lx5f;B)V

    const/16 v0, 0x22

    invoke-virtual {v5, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p1, Lz3f;

    invoke-virtual/range {p10 .. p10}, Lbr6;->a()Lesk;

    move-result-object v0

    iget-object v1, v4, Lqdh;->b:Lghf;

    invoke-direct {p1, v3, v0, v1}, Lz3f;-><init>(Lx5f;Lesk;Lghf;)V

    const/16 v0, 0x21

    invoke-virtual {v5, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-direct {p2, v5}, Lnv6;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lhqk;->u:Lnv6;

    return-void
.end method


# virtual methods
.method public final C()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final G(I)V
    .registers 12

    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Lhqk;->A:Lpvb;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_2f

    invoke-interface {v0}, Lpvb;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {p1}, Lvep;->A(I)I

    move-result v4

    if-eqz v4, :cond_2a

    if-eq v4, v2, :cond_27

    if-eq v4, v1, :cond_25

    const/4 v5, 0x3

    if-eq v4, v5, :cond_23

    move v4, v3

    goto :goto_2c

    :cond_23
    move v4, v1

    goto :goto_2c

    :cond_25
    move v4, v2

    goto :goto_2c

    :cond_27
    const/16 v4, 0x82

    goto :goto_2c

    :cond_2a
    const/16 v4, 0x21

    :goto_2c
    invoke-virtual {v0, v4}, Landroid/view/View;->focusSearch(I)Landroid/view/View;

    :cond_2f
    iget-object v0, p0, Lhqk;->A:Lpvb;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Lge5;

    const/16 v6, 0x1c

    iget-object v7, p0, Lhqk;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-direct {v5, v4, v7, v6}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v7, v5}, Lq9n;->I(Landroid/view/View;Lp9n;)V

    new-instance v5, Luc5;

    invoke-virtual {v7}, Landroid/view/View;->getLayoutDirection()I

    move-result v6

    if-ne v6, v2, :cond_4c

    move v6, v2

    goto :goto_4d

    :cond_4c
    move v6, v3

    :goto_4d
    invoke-direct {v5, v2, v6}, Luc5;-><init>(BZ)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move v5, v3

    :goto_54
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, -0x1

    if-ge v5, v6, :cond_68

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqvb;

    iget-object v6, v6, Lqvb;->a:Lpvb;

    if-eq v6, v0, :cond_69

    add-int/lit8 v5, v5, 0x1

    goto :goto_54

    :cond_68
    move v5, v7

    :cond_69
    if-ne v5, v7, :cond_79

    invoke-static {p1}, Lo18;->b(I)Z

    move-result v0

    if-eqz v0, :cond_73

    move v0, v3

    goto :goto_84

    :cond_73
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    goto :goto_84

    :cond_79
    invoke-static {p1}, Lo18;->b(I)Z

    move-result v0

    if-eqz v0, :cond_82

    add-int/lit8 v0, v5, 0x1

    goto :goto_84

    :cond_82
    add-int/lit8 v0, v5, -0x1

    :goto_84
    if-eq v5, v7, :cond_8f

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqvb;

    iget v5, v5, Lqvb;->c:I

    goto :goto_91

    :cond_8f
    const/high16 v5, -0x80000000

    :goto_91
    invoke-static {p1}, Lo18;->b(I)Z

    move-result v6

    if-eqz v6, :cond_98

    move v7, v2

    :cond_98
    :goto_98
    const/4 v6, 0x0

    if-ltz v0, :cond_d3

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v0, v8, :cond_d3

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lqvb;

    if-eq p1, v2, :cond_ae

    if-eq p1, v1, :cond_ae

    iget-object v0, v8, Lqvb;->a:Lpvb;

    goto :goto_d4

    :cond_ae
    iget v9, v8, Lqvb;->c:I

    if-eq v9, v5, :cond_d1

    if-ne p1, v2, :cond_ce

    :goto_b4
    if-lez v0, :cond_ce

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqvb;

    iget v1, v1, Lqvb;->c:I

    iget v5, v8, Lqvb;->c:I

    if-ne v1, v5, :cond_ce

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lqvb;

    goto :goto_b4

    :cond_ce
    iget-object v0, v8, Lqvb;->a:Lpvb;

    goto :goto_d4

    :cond_d1
    add-int/2addr v0, v7

    goto :goto_98

    :cond_d3
    move-object v0, v6

    :goto_d4
    if-nez v0, :cond_da

    invoke-virtual {p0, v6, v2}, Lhqk;->H(Lpvb;Z)V

    return-void

    :cond_da
    iget-object v1, p0, Lhqk;->A:Lpvb;

    if-eqz v1, :cond_e6

    invoke-interface {v1}, Lpvb;->getView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Llah;->o(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v6

    :cond_e6
    invoke-interface {v0}, Lpvb;->getView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Llah;->o(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v1

    if-eq v6, v1, :cond_12f

    if-eqz v1, :cond_12f

    iget-object v4, v1, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v4, :cond_12f

    iget-object v5, v1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v6, v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v6, :cond_12f

    check-cast v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-static {p1}, Lo18;->b(I)Z

    move-result v6

    if-nez v6, :cond_11b

    invoke-virtual {v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    move-result v6

    if-nez v6, :cond_10c

    if-eq p1, v2, :cond_11b

    :cond_10c
    invoke-virtual {v4}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v4

    if-ge v4, v3, :cond_12f

    invoke-virtual {v5, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_124

    :cond_11b
    invoke-virtual {v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v4

    if-lez v4, :cond_12f

    invoke-virtual {v5, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    :goto_124
    new-instance v0, Ld50;

    const/16 v2, 0xa

    invoke-direct {v0, v1, p0, p1, v2}, Ld50;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-virtual {v1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_12f
    invoke-virtual {p0, v0, v2}, Lhqk;->H(Lpvb;Z)V

    return-void
.end method

.method public final H(Lpvb;Z)V
    .registers 6

    iget-object v0, p0, Lhqk;->A:Lpvb;

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lhqk;->v:Lz61;

    if-eqz v0, :cond_14

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lpvb;->h(Z)V

    invoke-interface {v0}, Lpvb;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_14
    iput-object p1, p0, Lhqk;->A:Lpvb;

    if-eqz p1, :cond_23

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lpvb;->h(Z)V

    invoke-interface {p1}, Lpvb;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_23
    iget-object p1, p0, Lhqk;->A:Lpvb;

    invoke-virtual {p0, p1, p2}, Lhqk;->l(Lpvb;Z)V

    return-void
.end method

.method public final I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z
    .registers 11

    iget-object v0, p0, Lhqk;->r:Ll5b;

    iget-boolean v1, v0, Ll5b;->b:Z

    if-eqz v1, :cond_c

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    neg-int v1, v1

    goto :goto_10

    :cond_c
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    :goto_10
    iget-object v2, p0, Lhqk;->y:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_1a
    iget-object v5, p0, Lhqk;->y:Ljava/util/List;

    if-ge v4, v2, :cond_34

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgqk;

    iget-object v5, v5, Lgqk;->b:Lxpk;

    iget-boolean v6, v0, Ll5b;->b:Z

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v6, :cond_2f

    neg-int v5, v5

    :cond_2f
    if-ge v5, v1, :cond_38

    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    :cond_34
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    :cond_38
    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    if-nez p1, :cond_57

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-ge v4, p1, :cond_56

    iget-object p1, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgqk;

    iget p1, p1, Lgqk;->a:I

    if-ne p1, p2, :cond_56

    iget-object p1, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {p1, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    :cond_56
    return v3

    :cond_57
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v4, v0, :cond_76

    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgqk;

    iget v0, v0, Lgqk;->a:I

    if-ne v0, p2, :cond_76

    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-static {p1, p2, p3}, Llah;->i(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Lfqk;

    move-result-object p1

    invoke-interface {v0, v4, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    return v3

    :cond_76
    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-static {p1, p2, p3}, Llah;->i(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Lfqk;

    move-result-object p1

    invoke-interface {v0, v4, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/d;->notifyItemInserted(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final a0()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final f()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgqk;

    iget p0, p0, Lgqk;->a:I

    return p0
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Lhqk;->w:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 11

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p2

    const/16 v0, 0xb

    if-nez p2, :cond_2a

    move-object p2, p1

    check-cast p2, Lyqm;

    iget-object p2, p2, Lfmj;->d:Lfqk;

    if-eqz p2, :cond_101

    iget-object v1, p2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget v2, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-ne v2, v0, :cond_101

    invoke-virtual {v1}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lhqk;->c:Ls28;

    iget-object v3, v2, Ls28;->h:Ljava/lang/Object;

    check-cast v3, Lko7;

    new-instance v4, Lq2g;

    const/16 v5, 0x17

    invoke-direct {v4, v2, v1, v5}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lldk;->f(Ljava/lang/Runnable;)V

    goto :goto_8d

    :cond_2a
    sget p2, Ll55;->i:I

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p2

    const/4 v1, 0x3

    if-eq p2, v1, :cond_67

    const/4 v2, 0x5

    if-eq p2, v2, :cond_67

    const/4 v2, 0x4

    if-eq p2, v2, :cond_67

    instance-of p2, p1, Lnmh;

    if-eqz p2, :cond_101

    move-object p2, p1

    check-cast p2, Lnmh;

    iget-object p2, p2, Lfmj;->d:Lfqk;

    if-eqz p2, :cond_101

    iget-object v2, p0, Lhqk;->o:Lhw3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkul;

    iget-object v3, p2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v3}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, v2, Lkul;->c:La64;

    new-instance v5, Lful;

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-direct {v5, v2, v3, v6, v7}, Lful;-><init>(Lkul;Landroid/net/Uri;Lmt5;B)V

    invoke-static {v4, v6, v6, v5, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_8d

    :cond_67
    move-object p2, p1

    check-cast p2, Ll55;

    iget-object p2, p2, Lfmj;->d:Lfqk;

    if-eqz p2, :cond_101

    iget-object v1, p2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget v1, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v2, 0xd

    if-eq v1, v2, :cond_7a

    const/16 v2, 0xc

    if-ne v1, v2, :cond_101

    :cond_7a
    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    if-eqz v1, :cond_8d

    :try_start_8a
    invoke-virtual {v1}, Landroid/content/ClipboardManager;->clearPrimaryClip()V
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_8d} :catch_8d

    :catch_8d
    :cond_8d
    :goto_8d
    iget-object v1, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p2

    if-ltz p2, :cond_101

    iget-object v1, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    instance-of p1, p1, Lyqm;

    if-eqz p1, :cond_fc

    iget-object p1, p0, Lhqk;->y:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    instance-of p2, p1, Ljava/util/Collection;

    if-eqz p2, :cond_b2

    move-object p2, p1

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_cf

    :cond_b2
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_cf

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lgqk;

    instance-of v1, p2, Lfqk;

    if-eqz v1, :cond_b6

    check-cast p2, Lfqk;

    iget-object p2, p2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget p2, p2, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-ne p2, v0, :cond_b6

    goto :goto_fc

    :cond_cf
    iget-object p1, p0, Lhqk;->y:Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result p1

    const/4 p2, 0x0

    :goto_d8
    if-ge p2, p1, :cond_fc

    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgqk;

    instance-of v1, v0, Leqk;

    if-eqz v1, :cond_f9

    check-cast v0, Leqk;

    iget-object v0, v0, Leqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget v0, v0, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v1, 0x1d

    if-ne v0, v1, :cond_f9

    iget-object p1, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    goto :goto_fc

    :cond_f9
    add-int/lit8 p2, p2, 0x1

    goto :goto_d8

    :cond_fc
    :goto_fc
    iget-object p0, p0, Lhqk;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_101
    return-void
.end method

.method public final l(Lpvb;Z)V
    .registers 3

    iget-object p0, p0, Lhqk;->x:Liqk;

    invoke-interface {p0, p1, p2}, Liqk;->l(Lpvb;Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    const/4 p0, 0x0

    if-eqz p1, :cond_37

    instance-of v0, p1, Lyqm;

    const/4 v1, 0x1

    if-eqz v0, :cond_19

    check-cast p1, Lyqm;

    iget-object p1, p1, Lfmj;->d:Lfqk;

    if-nez p1, :cond_f

    return p0

    :cond_f
    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget p1, p1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v0, 0xb

    if-ne p1, v0, :cond_18

    return v1

    :cond_18
    return p0

    :cond_19
    instance-of v0, p1, Ll55;

    if-eqz v0, :cond_32

    check-cast p1, Ll55;

    iget-object p1, p1, Lfmj;->d:Lfqk;

    if-nez p1, :cond_24

    return p0

    :cond_24
    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget p1, p1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v0, 0xc

    if-eq p1, v0, :cond_31

    const/16 v0, 0xd

    if-eq p1, v0, :cond_31

    return p0

    :cond_31
    return v1

    :cond_32
    instance-of p1, p1, Lnmh;

    if-eqz p1, :cond_37

    return v1

    :cond_37
    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Lhqk;->t:Lb5a;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView;->c:Landroidx/recyclerview/widget/g;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/g;->c()Lro9;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lro9;->u(I)Lpph;

    move-result-object p0

    const/16 p1, 0x14

    iput-byte p1, p0, Lpph;->b:B

    iget-object p0, p0, Lpph;->a:Ljava/util/ArrayList;

    :goto_19
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_29

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_19

    :cond_29
    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 4

    check-cast p1, Lpa3;

    iget-object v0, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lgqk;

    iget-object p0, p0, Lhqk;->q:Ljava/lang/String;

    invoke-virtual {p1, p2, p0}, Lpa3;->U(Lgqk;Ljava/lang/String;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 21

    move-object/from16 v4, p0

    move/from16 v0, p2

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_200

    :pswitch_10
    move-object/from16 v5, p1

    move v3, v2

    goto :goto_56

    :pswitch_14
    const v3, 0x7f0d0351

    :goto_17
    move-object/from16 v5, p1

    goto :goto_56

    :pswitch_1a
    const v3, 0x7f0d03db

    goto :goto_17

    :pswitch_1e
    const v3, 0x7f0d001e

    goto :goto_17

    :pswitch_22
    const v3, 0x7f0d0360

    goto :goto_17

    :pswitch_26
    const v3, 0x7f0d00b6

    goto :goto_17

    :pswitch_2a
    const v3, 0x7f0d00ec

    goto :goto_17

    :pswitch_2e
    const v3, 0x7f0d0375

    goto :goto_17

    :pswitch_32
    const v3, 0x7f0d0374

    goto :goto_17

    :pswitch_36
    const v3, 0x7f0d0324

    goto :goto_17

    :pswitch_3a
    const v3, 0x7f0d0095

    goto :goto_17

    :pswitch_3e
    const v3, 0x7f0d03b2

    goto :goto_17

    :pswitch_42
    const v3, 0x7f0d03da

    goto :goto_17

    :pswitch_46
    const v3, 0x7f0d032a

    goto :goto_17

    :pswitch_4a
    const v3, 0x7f0d00de

    goto :goto_17

    :pswitch_4e
    const v3, 0x7f0d00cf

    goto :goto_17

    :pswitch_52
    const v3, 0x7f0d044e

    goto :goto_17

    :goto_56
    invoke-virtual {v1, v3, v5, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    const/16 v1, 0x8

    const/4 v3, 0x0

    const-string v5, "rootView"

    const v6, 0x7f0a06c5

    const/4 v7, 0x1

    iget-boolean v9, v4, Lhqk;->j:Z

    const-string v10, "Missing required view with ID: "

    iget-object v11, v4, Lhqk;->u:Lnv6;

    packed-switch v0, :pswitch_data_234

    :pswitch_6c
    invoke-static {}, Lt3p;->o()V

    return-object v3

    :pswitch_70
    new-instance v0, Lyk3;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v0, v8, v4, v11, v7}, Lyk3;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;B)V

    goto/16 :goto_1f5

    :pswitch_79
    new-instance v0, Lu3h;

    check-cast v8, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    invoke-direct {v0, v8, v4, v11}, Lu3h;-><init>(Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;Lhqk;Lnv6;)V

    goto/16 :goto_1f5

    :pswitch_82
    new-instance v0, Llmh;

    const v2, 0x7f0a0037

    invoke-static {v2, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v5, :cond_a5

    invoke-static {v6, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_a6

    new-instance v3, Lq5g;

    check-cast v8, Landroid/widget/FrameLayout;

    invoke-direct {v3, v8, v5, v2, v1}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v4, Lhqk;->p:Leek;

    invoke-direct {v0, v3, v1}, Llmh;-><init>(Lq5g;Leek;)V

    goto/16 :goto_1f5

    :cond_a5
    move v6, v2

    :cond_a6
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :pswitch_b6
    new-instance v0, Lrc5;

    const v1, 0x7f0a0067

    invoke-static {v1, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_cf

    new-instance v1, Lkf;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;

    invoke-direct {v1, v2, v8, v5}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lrc5;-><init>(Lkf;)V

    goto/16 :goto_1f5

    :cond_cf
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :pswitch_df
    new-instance v0, Lnmh;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v0, v8, v4, v11, v9}, Lnmh;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;I)V

    goto/16 :goto_1f5

    :pswitch_e8
    new-instance v0, Lrc5;

    if-eqz v8, :cond_fa

    new-instance v1, Lhl4;

    check-cast v8, Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {v1, v8, v2}, Lhl4;-><init>(Landroidx/recyclerview/widget/RecyclerView;B)V

    iget-object v2, v4, Lhqk;->n:Lpde;

    invoke-direct {v0, v1, v4, v2, v11}, Lrc5;-><init>(Lhl4;Lhqk;Lpde;Lnv6;)V

    goto/16 :goto_1f5

    :cond_fa
    invoke-static {v5}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :pswitch_fe
    new-instance v0, Ld76;

    const v2, 0x7f0a02b1

    invoke-static {v2, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/suggestion/SuggestionButtonTargetView;

    if-eqz v5, :cond_128

    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Ltxi;

    const/16 v3, 0x1d

    invoke-direct {v2, v4, v3}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v8}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    new-instance v6, Llb4;

    invoke-direct {v6, v2, v3}, Llb4;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v5, Lcom/opera/android/suggestion/SuggestionButtonTargetView;->R:Llb4;

    new-instance v3, Lyk4;

    invoke-direct {v3, v2, v1}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_1f5

    :cond_128
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :pswitch_138
    new-instance v0, Ldsi;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v0, v8, v4, v9}, Ldsi;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;I)V

    goto/16 :goto_1f5

    :pswitch_141
    new-instance v0, Lzri;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v0, v8, v4, v9}, Lzri;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;I)V

    goto/16 :goto_1f5

    :pswitch_14a
    new-instance v0, Lf3g;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    new-instance v1, Lwpk;

    invoke-direct {v1, v4, v2}, Lwpk;-><init>(Lhqk;B)V

    invoke-direct {v0, v8, v4, v11, v1}, Lf3g;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;Lwpk;)V

    goto/16 :goto_1f5

    :pswitch_158
    new-instance v0, Lyk3;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v0, v8, v4, v11, v2}, Lyk3;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;B)V

    goto/16 :goto_1f5

    :pswitch_161
    new-instance v5, Ld0k;

    new-instance v0, Likc;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iget-boolean v1, v4, Lhqk;->z:Z

    if-eqz v1, :cond_175

    sget-object v1, Lp6l;->b:Lp6l;

    :goto_172
    move-object/from16 v17, v1

    goto :goto_178

    :cond_175
    sget-object v1, Lp6l;->a:Lp6l;

    goto :goto_172

    :goto_178
    iget-object v6, v4, Lhqk;->a:Lfe5;

    iget-object v7, v4, Lhqk;->e:Lipk;

    iget-object v9, v4, Lhqk;->f:Lx5f;

    iget-object v10, v4, Lhqk;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v11, v4, Lhqk;->h:Lx5f;

    iget-object v12, v4, Lhqk;->g:Losf;

    iget-object v13, v4, Lhqk;->i:Lcbf;

    iget-object v14, v4, Lhqk;->l:Lqr8;

    iget-object v15, v4, Lhqk;->m:Lnv2;

    move-object/from16 v16, v0

    invoke-direct/range {v5 .. v17}, Ld0k;-><init>(Lfe5;Lipk;Landroid/view/View;Lx5f;Lcom/opera/android/settings/SettingsManager;Lx5f;Losf;Lcbf;Lqr8;Lnv2;Likc;Lp6l;)V

    move-object v0, v5

    goto/16 :goto_1f5

    :pswitch_192
    new-instance v0, Lrc5;

    invoke-static {v6, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_1a7

    new-instance v2, Lswc;

    check-cast v8, Landroid/widget/FrameLayout;

    invoke-direct {v2, v8, v1, v7}, Lswc;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;B)V

    invoke-direct {v0, v2}, Lrc5;-><init>(Lswc;)V

    goto :goto_1f5

    :cond_1a7
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :pswitch_1b7
    new-instance v1, Ll55;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v1, v8, v4, v0}, Ll55;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;I)V

    move-object v0, v1

    goto :goto_1f5

    :pswitch_1c0
    new-instance v1, Lrc5;

    if-eqz v8, :cond_1ea

    check-cast v8, Lcom/opera/android/suggestion/CompactSuggestionView;

    move-object v3, v1

    new-instance v1, Lkf;

    const/4 v5, 0x7

    invoke-direct {v1, v5, v8, v8}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    move v5, v2

    new-instance v2, Lthk;

    const/4 v6, 0x2

    invoke-direct {v2, v6}, Lthk;-><init>(B)V

    const/16 v6, 0x12

    if-eq v0, v6, :cond_1db

    move v6, v5

    move v5, v7

    goto :goto_1dc

    :cond_1db
    move v6, v5

    :goto_1dc
    const/16 v8, 0x16

    if-eq v0, v8, :cond_1e3

    move v0, v7

    move v7, v6

    move v6, v0

    :cond_1e3
    move-object v0, v3

    iget-object v3, v4, Lhqk;->u:Lnv6;

    invoke-direct/range {v0 .. v7}, Lrc5;-><init>(Lkf;Lthk;Lnv6;Lhqk;ZZZ)V

    goto :goto_1f5

    :cond_1ea
    invoke-static {v5}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :pswitch_1ee
    new-instance v0, Lyqm;

    check-cast v8, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-direct {v0, v8, v4, v11, v9}, Lyqm;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;I)V

    :goto_1f5
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iget-object v2, v4, Lhqk;->s:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    :pswitch_data_200
    .packed-switch 0x0
        :pswitch_52
        :pswitch_4e
        :pswitch_4e
        :pswitch_4a
        :pswitch_46
        :pswitch_46
        :pswitch_42
        :pswitch_3e
        :pswitch_3a
        :pswitch_36
        :pswitch_32
        :pswitch_2e
        :pswitch_2a
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_26
        :pswitch_22
        :pswitch_4e
        :pswitch_1e
        :pswitch_1a
        :pswitch_14
        :pswitch_4e
        :pswitch_3a
    .end packed-switch

    :pswitch_data_234
    .packed-switch 0x0
        :pswitch_1ee
        :pswitch_1c0
        :pswitch_1c0
        :pswitch_1b7
        :pswitch_1b7
        :pswitch_1b7
        :pswitch_192
        :pswitch_161
        :pswitch_158
        :pswitch_14a
        :pswitch_141
        :pswitch_138
        :pswitch_fe
        :pswitch_6c
        :pswitch_6c
        :pswitch_6c
        :pswitch_e8
        :pswitch_df
        :pswitch_1c0
        :pswitch_b6
        :pswitch_82
        :pswitch_79
        :pswitch_1c0
        :pswitch_70
    .end packed-switch
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    iget-object v0, p0, Lhqk;->t:Lb5a;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lpa3;

    invoke-virtual {p1}, Lpa3;->Y()V

    return-void
.end method

.method public final q(Lcom/opera/android/suggestion/Suggestion;Z)V
    .registers 6

    iget v0, p1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v1, 0xa

    const/4 v2, 0x1

    if-ne v0, v1, :cond_19

    iget-object p2, p0, Lhqk;->x:Liqk;

    invoke-interface {p2, p1, v2}, Liqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    iget-object p0, p0, Lhqk;->f:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_13

    return-void

    :cond_13
    const/16 p1, 0x9

    invoke-virtual {p0, p1}, Lx5f;->o(I)V

    return-void

    :cond_19
    iget-object p0, p0, Lhqk;->x:Liqk;

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_23

    invoke-interface {p0, p1, v2}, Liqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    return-void

    :cond_23
    const/16 v1, 0x21

    if-ne v0, v1, :cond_2b

    invoke-interface {p0, p1, v2}, Liqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    return-void

    :cond_2b
    invoke-interface {p0, p1, p2}, Liqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    return-void
.end method
