.class public final Lgn3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Ljvk;


# instance fields
.field public A:Lum3;

.field public final B:Lmvk;

.field public final C:Lvi7;

.field public D:Lxw;

.field public E:Landroidx/recyclerview/widget/e;

.field public F:Lflb;

.field public G:Lbm3;

.field public H:Lsom;

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:I

.field public N:I

.field public final a:Ljava/util/ArrayList;

.field public final b:Lcom/opera/android/bookmarks/h;

.field public final c:Ldl3;

.field public final d:Lzm3;

.field public final e:Lom3;

.field public final f:Lne5;

.field public final g:Lx5f;

.field public final h:Lzwk;

.field public final i:Ldb;

.field public final j:Lcom/opera/android/settings/SettingsManager;

.field public final k:Lcq5;

.field public final l:Lfn3;

.field public final m:Lhxk;

.field public final n:Lsl6;

.field public o:Ljava/lang/Runnable;

.field public p:Landroidx/fragment/app/r;

.field public q:Ly83;

.field public r:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public s:Lxm3;

.field public final t:Lim3;

.field public final u:Ltzi;

.field public final v:Lvx;

.field public final w:Liu2;

.field public final x:Lgjm;

.field public final y:Lrm3;

.field public final z:Ldm3;


# direct methods
.method public constructor <init>(Lim3;Ltzi;Lvx;Liu2;Lx5f;Li53;Lzwk;Ldb;Lcom/opera/android/settings/SettingsManager;Lcq5;Lom3;Lhxk;Lsl6;Lgjm;)V
    .registers 24

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lgn3;->a:Ljava/util/ArrayList;

    new-instance v0, Ldl3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ldl3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lgn3;->c:Ldl3;

    new-instance v0, Lfn3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfn3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lgn3;->l:Lfn3;

    const v0, 0x7f140564

    invoke-static {v0}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Lgn3;->B:Lmvk;

    new-instance v2, Lvi7;

    sget-object v3, Lvml;->d:Lumi;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v8}, Lvi7;-><init>(Lumi;IZILns8;Z)V

    iput-object v2, p0, Lgn3;->C:Lvi7;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lgn3;->J:Z

    iput-object p1, p0, Lgn3;->t:Lim3;

    iput-object p2, p0, Lgn3;->u:Ltzi;

    iput-object p3, p0, Lgn3;->v:Lvx;

    iput-object p4, p0, Lgn3;->w:Liu2;

    move-object/from16 p1, p14

    iput-object p1, p0, Lgn3;->x:Lgjm;

    sget-object p1, Lrm3;->e:Lrm3;

    iput-object p1, p0, Lgn3;->y:Lrm3;

    sget-object p1, Ldm3;->e:Ldm3;

    iput-object p1, p0, Lgn3;->z:Ldm3;

    iput-object p5, p0, Lgn3;->g:Lx5f;

    check-cast p6, Lcom/opera/android/bookmarks/h;

    iput-object p6, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    move-object/from16 p1, p7

    iput-object p1, p0, Lgn3;->h:Lzwk;

    move-object/from16 p1, p8

    iput-object p1, p0, Lgn3;->i:Ldb;

    move-object/from16 p1, p9

    iput-object p1, p0, Lgn3;->j:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 p1, p10

    iput-object p1, p0, Lgn3;->k:Lcq5;

    move-object/from16 p1, p13

    iput-object p1, p0, Lgn3;->n:Lsl6;

    move-object/from16 p1, p11

    iput-object p1, p0, Lgn3;->e:Lom3;

    move-object/from16 p1, p12

    iput-object p1, p0, Lgn3;->m:Lhxk;

    new-instance p1, Lzm3;

    invoke-direct {p1, p0}, Lzm3;-><init>(Lgn3;)V

    iput-object p1, p0, Lgn3;->d:Lzm3;

    new-instance p1, Lne5;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p6, p1, Lne5;->a:Ljava/lang/Object;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p1, Lne5;->b:Ljava/lang/Object;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p1, Lne5;->d:Ljava/lang/Object;

    new-instance p3, Lhn3;

    invoke-direct {p3, p1, v1}, Lhn3;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p1, Lne5;->e:Ljava/lang/Object;

    invoke-static {p2}, Landroid/icu/text/Collator;->getInstance(Ljava/util/Locale;)Landroid/icu/text/Collator;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/icu/text/Collator;->setStrength(I)V

    check-cast p2, Landroid/icu/text/RuleBasedCollator;

    iput-object p2, p1, Lne5;->g:Ljava/lang/Object;

    iput-object p1, p0, Lgn3;->f:Lne5;

    return-void
.end method


# virtual methods
.method public final a()Lml3;
    .registers 1

    invoke-virtual {p0}, Lgn3;->b()Lym3;

    move-result-object p0

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    iget-object p0, p0, Lym3;->a:Lml3;

    return-object p0
.end method

.method public final b()Lym3;
    .registers 2

    iget-object p0, p0, Lgn3;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    const/4 v0, 0x1

    invoke-static {v0, p0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lym3;

    return-object p0
.end method

.method public final c()Ljava/util/ArrayList;
    .registers 7

    iget-object v0, p0, Lgn3;->u:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    iget-object v0, v0, Le5d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iget-object v4, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    const/4 v5, 0x1

    invoke-virtual {v4, v2, v3, v5}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v2

    if-eqz v2, :cond_19

    invoke-static {v2}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_3a
    return-object v1
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lgn3;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lgn3;->t:Lim3;

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :cond_1e
    invoke-virtual {p0}, Lgn3;->g()V

    return-void
.end method

.method public final e()Z
    .registers 2

    iget-object v0, p0, Lgn3;->y:Lrm3;

    invoke-virtual {v0}, Lshf;->q()V

    iget-boolean p0, p0, Lgn3;->I:Z

    if-eqz p0, :cond_15

    iget-object p0, v0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lgn3;->A:Lum3;

    if-eqz v0, :cond_8

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    :cond_8
    iget-object v0, p0, Lgn3;->q:Ly83;

    iget-object v0, v0, Ly83;->h:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Lgn3;->b()Lym3;

    move-result-object v0

    if-eqz v0, :cond_21

    iget-object v1, v0, Lym3;->a:Lml3;

    :cond_21
    iget-object v2, p0, Lgn3;->z:Ldm3;

    invoke-virtual {v2, v1}, Lshf;->S(Ljava/lang/Object;)V

    iget-object v2, p0, Lgn3;->s:Lxm3;

    iput-object v1, v2, Lxm3;->c:Lml3;

    invoke-virtual {v2}, Lxm3;->J()V

    iget-object v2, p0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v3, p0, Lgn3;->G:Lbm3;

    iget-object v3, v3, Lyz7;->c:Lx93;

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    if-eqz v0, :cond_3f

    iget-object v0, v0, Lym3;->b:Landroid/util/SparseArray;

    iget-object v2, p0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v2, v0}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :cond_3f
    iget-object p0, p0, Lgn3;->w:Liu2;

    invoke-virtual {p0, v1}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Lgn3;->B:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .registers 5

    iget-boolean v0, p0, Lgn3;->I:Z

    if-eqz v0, :cond_36

    iget-boolean v0, p0, Lgn3;->J:Z

    if-nez v0, :cond_36

    iget-object v0, p0, Lgn3;->y:Lrm3;

    if-eqz p1, :cond_21

    iget-object v1, v0, Lshf;->a:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    iget-boolean v1, p0, Lgn3;->K:Z

    if-nez v1, :cond_21

    const/4 v1, 0x1

    iput-boolean v1, p0, Lgn3;->K:Z

    iget-object v1, p0, Lgn3;->g:Lx5f;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lx5f;->S(I)V

    :cond_21
    invoke-virtual {v0, p1}, Lshf;->S(Ljava/lang/Object;)V

    iget-object p0, p0, Lgn3;->s:Lxm3;

    iget-object p1, p0, Lxm3;->l:Lgn3;

    invoke-virtual {p1}, Lgn3;->e()Z

    move-result p1

    if-nez p1, :cond_32

    invoke-virtual {p0}, Lxm3;->J()V

    return-void

    :cond_32
    invoke-virtual {p0}, Lxm3;->M()V

    return-void

    :cond_36
    const/4 p1, 0x0

    iput-boolean p1, p0, Lgn3;->J:Z

    return-void
.end method

.method public final j(Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .registers 9

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lgn3;->j:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object v0

    sget-object v1, Lq7j;->c:Lq7j;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_15

    move v0, v2

    goto :goto_16

    :cond_15
    move v0, v3

    :goto_16
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpl3;

    invoke-interface {v1}, Lpl3;->getUrl()Lshf;

    move-result-object v1

    iget-object v1, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    sget-object v4, Llqm;->g:Llqm;

    invoke-static {v1, v4, v3}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v1

    invoke-virtual {v1, v2}, Lvx3;->c(Z)V

    invoke-virtual {v1, p3}, Lvx3;->e(Z)V

    invoke-virtual {v1, v0}, Lvx3;->a(Z)V

    iput-boolean v3, v1, Lvx3;->f:Z

    invoke-virtual {v1, v2}, Lvx3;->d(Z)V

    new-instance p3, Lv4l;

    invoke-direct {p3, p2, v3, v3}, Lv4l;-><init>(Ljava/lang/String;ZZ)V

    iput-object p3, v1, Lvx3;->i:Lv4l;

    :goto_3f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge v2, p2, :cond_59

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lpl3;

    invoke-interface {p2}, Lpl3;->getUrl()Lshf;

    move-result-object p2

    iget-object p2, p2, Lshf;->a:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {v1, p2, v3}, Lvx3;->b(Ljava/lang/String;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3f

    :cond_59
    iget-object p0, p0, Lgn3;->u:Ltzi;

    invoke-virtual {p0}, Ltzi;->d()V

    new-instance p0, Lay3;

    invoke-direct {p0, v1}, Lay3;-><init>(Lvx3;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 3

    check-cast p1, Ld7n;

    iget-object p1, p1, Le7n;->i:Lqhc;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lgn3;->p(Ljava/util/List;)V

    return-void
.end method

.method public final l(Ljava/util/List;)V
    .registers 8

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lal3;

    new-instance v4, Lsa2;

    const/4 v5, 0x4

    invoke-direct {v4, v5, v0}, Lsa2;-><init>(BZ)V

    invoke-interface {v3, v4}, Lal3;->c(Lzk3;)Z

    iget v4, v4, Lsa2;->b:I

    add-int/2addr v1, v4

    new-instance v4, Lsa2;

    const/4 v5, 0x3

    invoke-direct {v4, v5, v0}, Lsa2;-><init>(BZ)V

    invoke-interface {v3, v4}, Lal3;->c(Lzk3;)Z

    iget v3, v4, Lsa2;->b:I

    add-int/2addr v2, v3

    goto :goto_7

    :cond_2c
    iput v1, p0, Lgn3;->M:I

    iput v2, p0, Lgn3;->N:I

    return-void
.end method

.method public final m(Lal3;)V
    .registers 3

    invoke-interface {p1}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_9

    check-cast p1, Lml3;

    goto :goto_13

    :cond_9
    iget-object v0, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-interface {p1, v0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p1

    :goto_13
    if-eqz p1, :cond_23

    invoke-virtual {p0}, Lgn3;->a()Lml3;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lgn3;->o(Lml3;Z)V

    :cond_23
    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    iget-object p0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p0, p1, Lxz7;

    if-eqz p0, :cond_b

    const/4 p0, 0x0

    return p0

    :cond_b
    check-cast p1, Le7n;

    iget-object p0, p1, Le7n;->i:Lqhc;

    invoke-virtual {p0}, Lqhc;->a()Z

    move-result p0

    return p0
.end method

.method public final o(Lml3;Z)V
    .registers 5

    iget-object v0, p0, Lgn3;->a:Ljava/util/ArrayList;

    if-eqz p2, :cond_7

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_7
    invoke-interface {p1}, Lml3;->h()Z

    move-result p2

    if-eqz p2, :cond_16

    new-instance p0, Lym3;

    invoke-direct {p0, p1}, Lym3;-><init>(Lml3;)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_16
    iget-object p2, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {p2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p2

    invoke-interface {p1, p2}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p2

    if-nez p2, :cond_23

    return-void

    :cond_23
    const/4 v1, 0x0

    invoke-virtual {p0, p2, v1}, Lgn3;->o(Lml3;Z)V

    new-instance p0, Lym3;

    invoke-direct {p0, p1}, Lym3;-><init>(Lml3;)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-object v0, p0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_b4

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->I(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_d

    move-object v0, v2

    goto :goto_11

    :cond_d
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v0

    :goto_11
    check-cast v0, Le7n;

    if-eqz v0, :cond_b4

    iget-object v1, v0, Le7n;->i:Lqhc;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const v4, 0x7f0a05ba

    if-ne v3, v4, :cond_2d

    new-instance v0, Lxw;

    invoke-direct {v0, p0, v1}, Lxw;-><init>(Lgn3;Lqhc;)V

    iput-object v0, p0, Lgn3;->D:Lxw;

    iput-object v1, v0, Lo73;->h:Lqhc;

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :cond_2d
    iget-object p1, p0, Lgn3;->u:Ltzi;

    iget-boolean v3, p1, Ltzi;->g:Z

    if-eqz v3, :cond_43

    invoke-virtual {v1}, Lqhc;->a()Z

    move-result p0

    if-eqz p0, :cond_b4

    iget-object p0, p1, Ltzi;->a:Le5d;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getItemId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Le5d;->d(J)V

    return-void

    :cond_43
    iget-object p1, v1, Lqhc;->a:Lal3;

    invoke-interface {p1}, Lol3;->g()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a4

    iget-boolean v0, p0, Lgn3;->I:Z

    if-eqz v0, :cond_54

    invoke-virtual {p0, p1}, Lgn3;->m(Lal3;)V

    goto :goto_a0

    :cond_54
    invoke-virtual {p0}, Lgn3;->a()Lml3;

    move-result-object v0

    if-eqz v0, :cond_6a

    invoke-interface {v0}, Lml3;->h()Z

    move-result v3

    if-nez v3, :cond_6a

    iget-object v2, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    invoke-interface {v0, v2}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v2

    :cond_6a
    if-eqz v2, :cond_71

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_72

    :cond_71
    move v0, v1

    :goto_72
    iget-object v2, p0, Lgn3;->a:Ljava/util/ArrayList;

    if-eqz v0, :cond_96

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x2

    if-lt v0, v3, :cond_8a

    sub-int/2addr v0, v3

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lym3;

    iget-object v0, v0, Lym3;->a:Lml3;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    :cond_8a
    if-eqz v1, :cond_96

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_a0

    :cond_96
    check-cast p1, Lml3;

    new-instance v0, Lym3;

    invoke-direct {v0, p1}, Lym3;-><init>(Lml3;)V

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_a0
    invoke-virtual {p0}, Lgn3;->g()V

    return-void

    :cond_a4
    check-cast p1, Lpl3;

    invoke-interface {p1}, Lpl3;->getUrl()Lshf;

    move-result-object p0

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_b5

    :cond_b4
    return-void

    :cond_b5
    invoke-static {p0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p1

    sget-object v0, Llqm;->g:Llqm;

    invoke-static {p0, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    iput-boolean p1, p0, Lvx3;->q:Z

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 7

    iget-object v0, p0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    iget-boolean v2, p0, Lgn3;->I:Z

    if-nez v2, :cond_19

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->I(Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_11

    const/4 p1, 0x0

    goto :goto_15

    :cond_11
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p1

    :goto_15
    check-cast p1, Le7n;

    if-nez p1, :cond_1a

    :cond_19
    return v1

    :cond_1a
    iget-object v0, p1, Le7n;->i:Lqhc;

    iget v0, v0, Lqhc;->b:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_35

    iget-object v0, p0, Lgn3;->C:Lvi7;

    iget-object v3, v0, Lvi7;->g:Lflb;

    iget v3, v3, Lflb;->p:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_35

    iget-object p0, p0, Lgn3;->u:Ltzi;

    invoke-virtual {p0}, Ltzi;->d()V

    iget-object p0, v0, Lvi7;->g:Lflb;

    invoke-virtual {p0, p1}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    return v2

    :cond_35
    return v1
.end method

.method public final p(Ljava/util/List;)V
    .registers 5

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lmn;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lmn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {v0}, Lj$/util/stream/Stream$-EL;->toList(Ljava/util/stream/Stream;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lgn3;->l(Ljava/util/List;)V

    iget-object v0, p0, Lgn3;->A:Lum3;

    iget p0, p0, Lgn3;->M:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_29

    :cond_28
    return-void

    :cond_29
    iput-boolean v2, v0, Lcom/opera/android/undo/UndoBar;->g:Z

    iget-object v1, v0, Lcom/opera/android/undo/UndoBar;->e:Lkkm;

    invoke-interface {v1, p1}, Lkkm;->N(Ljava/util/List;)Le5d;

    move-result-object p1

    iget-object v1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_51

    iget-object v1, v0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v1, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v1, Lmhk;

    new-instance v2, Lmkm;

    invoke-direct {v2, p1, p0}, Lmkm;-><init>(Le5d;I)V

    invoke-virtual {v1, v2}, Lmhk;->g(Lmkm;)V

    invoke-virtual {v0}, Lum3;->f()V

    iget-object p0, v0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    invoke-virtual {p0}, Lami;->u()V

    :cond_51
    const/4 p0, 0x0

    iput-boolean p0, v0, Lcom/opera/android/undo/UndoBar;->g:Z

    return-void
.end method

.method public final q()Z
    .registers 2

    iget-object v0, p0, Lgn3;->k:Lcq5;

    invoke-virtual {v0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    invoke-virtual {v0}, Lf8f;->f()Z

    move-result v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lgn3;->n:Lsl6;

    invoke-virtual {v0}, Lsl6;->b()Z

    move-result v0

    if-nez v0, :cond_20

    iget-object p0, p0, Lgn3;->i:Ldb;

    invoke-virtual {p0}, Ldb;->f()Z

    move-result p0

    if-nez p0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final r(Lal3;)V
    .registers 6

    invoke-interface {p1}, Lol3;->g()Z

    move-result v0

    sget-object v1, Lw80;->b:Lw80;

    const/4 v2, 0x0

    if-eqz v0, :cond_14

    new-instance v0, Las;

    iget-object v3, p0, Lgn3;->x:Lgjm;

    invoke-direct {v0, v3}, Las;-><init>(Lgjm;)V

    invoke-static {p1, v2, v0, v1, v2}, Lss7;->L0(Lal3;Lml3;Lss7;Lw80;Lole;)V

    goto :goto_1c

    :cond_14
    new-instance v0, Lts7;

    invoke-direct {v0}, Lts7;-><init>()V

    invoke-static {p1, v2, v0, v1, v2}, Lss7;->L0(Lal3;Lml3;Lss7;Lw80;Lole;)V

    :goto_1c
    const/16 p1, 0x1001

    invoke-static {v0, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final s(Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .registers 6

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_25

    new-instance v0, Lwm3;

    invoke-direct {v0, p0, p1, p2, p3}, Lwm3;-><init>(Lgn3;Ljava/util/ArrayList;Ljava/lang/String;Z)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-instance p2, Lbn3;

    invoke-direct {p2, v0, p1}, Lbn3;-><init>(Lwm3;I)V

    iget-object p0, p0, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, p2, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_25
    invoke-virtual {p0, p1, p2, p3}, Lgn3;->j(Ljava/util/ArrayList;Ljava/lang/String;Z)V

    return-void
.end method

.method public final t(Z)V
    .registers 7

    invoke-virtual {p0}, Lgn3;->c()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_29

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqhc;

    iget-object v1, v1, Lqhc;->a:Lal3;

    invoke-interface {v1}, Lol3;->g()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqhc;

    iget-object v1, v1, Lqhc;->a:Lal3;

    check-cast v1, Lml3;

    invoke-interface {v1}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v1

    goto :goto_67

    :cond_29
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_66

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqhc;

    iget-object v1, v1, Lqhc;->a:Lal3;

    iget-object v2, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    invoke-interface {v1, v2}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v1

    if-eqz v1, :cond_66

    invoke-interface {v1}, Lml3;->i()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v3, v4, :cond_66

    invoke-interface {v2}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v3, Lzx1;

    const/4 v4, 0x3

    invoke-direct {v3, v0, v4}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->allMatch(Ljava/util/function/Predicate;)Z

    move-result v2

    if-eqz v2, :cond_66

    invoke-interface {v1}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v1

    goto :goto_67

    :cond_66
    const/4 v1, 0x0

    :goto_67
    invoke-static {v0}, Lalo;->j(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lalo;->r(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0, v0, v1, p1}, Lgn3;->s(Ljava/util/ArrayList;Ljava/lang/String;Z)V

    return-void
.end method

.method public final u()V
    .registers 6

    iget-boolean v0, p0, Lgn3;->I:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lgn3;->G:Lbm3;

    sget-object v2, Lcm3;->e:Lcm3;

    invoke-virtual {v0, v2}, Lbm3;->g(Lcm3;)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {v0, v1}, Lbm3;->e(Z)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {v0, v1}, Lbm3;->f(Z)V

    iget-object p0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {p0, v1}, Lbm3;->h(Z)V

    return-void

    :cond_1c
    iget-boolean v0, p0, Lgn3;->L:Z

    iget-object v2, p0, Lgn3;->G:Lbm3;

    if-eqz v0, :cond_37

    sget-object v0, Lcm3;->f:Lcm3;

    invoke-virtual {v2, v0}, Lbm3;->g(Lcm3;)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {v0, v1}, Lbm3;->e(Z)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {v0, v1}, Lbm3;->f(Z)V

    iget-object p0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {p0, v1}, Lbm3;->h(Z)V

    return-void

    :cond_37
    sget-object v0, Lcm3;->d:Lcm3;

    invoke-virtual {v2, v0}, Lbm3;->g(Lcm3;)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    iget-object v2, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->s()Z

    move-result v2

    const/4 v3, 0x1

    iget-object v4, p0, Lgn3;->n:Lsl6;

    if-eqz v2, :cond_51

    invoke-virtual {v4}, Lsl6;->b()Z

    move-result v2

    if-eqz v2, :cond_51

    move v2, v3

    goto :goto_52

    :cond_51
    move v2, v1

    :goto_52
    invoke-virtual {v0, v2}, Lbm3;->e(Z)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    iget-object v2, p0, Lgn3;->k:Lcq5;

    invoke-virtual {v2}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lf8f;

    invoke-virtual {v2}, Lf8f;->f()Z

    move-result v2

    if-nez v2, :cond_6c

    invoke-virtual {v4}, Lsl6;->b()Z

    move-result v2

    if-nez v2, :cond_6c

    move v1, v3

    :cond_6c
    invoke-virtual {v0, v1}, Lbm3;->f(Z)V

    iget-object v0, p0, Lgn3;->G:Lbm3;

    invoke-virtual {p0}, Lgn3;->q()Z

    move-result p0

    invoke-virtual {v0, p0}, Lbm3;->h(Z)V

    return-void
.end method
