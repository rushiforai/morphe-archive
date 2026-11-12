.class public final Lztn;
.super Lbca;
.source "SourceFile"


# static fields
.field public static final m:Ljava/text/DateFormat;


# instance fields
.field public final a:Landroidx/fragment/app/r;

.field public final b:Ltzi;

.field public final c:Lga6;

.field public final d:I

.field public final e:Lj4c;

.field public final f:Ljava/util/HashSet;

.field public g:Lwjj;

.field public final h:Ljava/util/HashSet;

.field public i:Ljava/text/DateFormat;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public l:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lztn;->m:Ljava/text/DateFormat;

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/r;Ltzi;Lga6;)V
    .registers 5

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p1, p0, Lztn;->a:Landroidx/fragment/app/r;

    iput-object p2, p0, Lztn;->b:Ltzi;

    iput-object p3, p0, Lztn;->c:Lga6;

    const p2, 0x7f14082d

    iput p2, p0, Lztn;->d:I

    new-instance p2, Ljjg;

    const/16 p3, 0xf

    invoke-direct {p2, p0, p3}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lj4c;

    const/4 v0, 0x1

    invoke-direct {p3, p2, v0}, Lj4c;-><init>(Lesk;B)V

    iput-object p3, p0, Lztn;->e:Lj4c;

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lztn;->f:Ljava/util/HashSet;

    new-instance p2, Lwjj;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p2, p3}, Lwjj;-><init>(Ljava/util/ArrayList;)V

    iput-object p2, p0, Lztn;->g:Lwjj;

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lztn;->h:Ljava/util/HashSet;

    invoke-static {p1}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object p2

    iput-object p2, p0, Lztn;->i:Ljava/text/DateFormat;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f140835

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lztn;->j:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f140836

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lztn;->k:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final G()I
    .registers 1

    iget p0, p0, Lztn;->d:I

    return p0
.end method

.method public final H(J)Laca;
    .registers 3

    iget-object p0, p0, Lztn;->g:Lwjj;

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/history/g;

    return-object p0
.end method

.method public final I()Lj4c;
    .registers 1

    iget-object p0, p0, Lztn;->e:Lj4c;

    return-object p0
.end method

.method public final J()Z
    .registers 1

    invoke-virtual {p0}, Lztn;->getItemCount()I

    move-result p0

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final K(Landroidx/recyclerview/widget/i;)V
    .registers 5

    if-eqz p1, :cond_35

    instance-of v0, p1, Lfxn;

    if-eqz v0, :cond_1c

    check-cast p1, Lfxn;

    iget-object p1, p1, Ljxn;->f:Lvtn;

    check-cast p1, Lwtn;

    if-eqz p1, :cond_35

    iget-object v0, p0, Lztn;->l:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_35

    new-instance v1, Lfmn;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1c
    instance-of v0, p1, Lhxn;

    if-eqz v0, :cond_35

    check-cast p1, Lhxn;

    iget-object p1, p1, Ljxn;->f:Lvtn;

    check-cast p1, Lcom/opera/android/history/g;

    if-eqz p1, :cond_35

    iget-object v0, p0, Lztn;->l:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_35

    new-instance v1, Lfmn;

    const/4 v2, 0x3

    invoke-direct {v1, p0, p1, v2}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_35
    return-void
.end method

.method public final L(Ljava/util/List;)V
    .registers 8

    iget-object v0, p0, Lztn;->f:Ljava/util/HashSet;

    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lztn;->c:Lga6;

    iget-object v0, v0, Lga6;->b:Ljava/lang/Object;

    check-cast v0, Ldda;

    iget-object v0, v0, Ldda;->B:Lcom/opera/android/undo/UndoBar;

    if-nez v0, :cond_13

    const/4 v0, 0x0

    :cond_13
    invoke-virtual {v0, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    iget-object v0, p0, Lztn;->l:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    if-eqz v0, :cond_23

    new-instance v2, Lttn;

    invoke-direct {v2, p0, v1}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_27
    :goto_27
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    iget-object v0, p0, Lztn;->b:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    iget-object v4, v0, Le5d;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/LinkedHashSet;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-virtual {v0, v2, v3, v1}, Le5d;->c(JZ)V

    goto :goto_27

    :cond_4d
    return-void
.end method

.method public final M()V
    .registers 12

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Lztn;->g:Lwjj;

    iget-object v1, v1, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lztn;->g:Lwjj;

    iget-object v1, v1, Lwjj;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_1a
    const/4 v4, 0x1

    if-ge v3, v1, :cond_c6

    iget-object v5, p0, Lztn;->g:Lwjj;

    iget-object v5, v5, Lwjj;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v6, v2

    :cond_31
    :goto_31
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lvtn;

    invoke-virtual {v7}, Lvtn;->c()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    iget-object v9, p0, Lztn;->f:Ljava/util/HashSet;

    invoke-virtual {v9, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_31

    invoke-virtual {v7}, Lvtn;->e()V

    invoke-virtual {v7}, Lvtn;->b()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_60

    iget-object v8, p0, Lztn;->g:Lwjj;

    iget-object v8, v8, Lwjj;->d:Ljava/lang/Object;

    check-cast v8, Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_31

    :cond_60
    invoke-virtual {v0, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvtn;

    if-nez v6, :cond_75

    iget-object v6, p0, Lztn;->g:Lwjj;

    iget-object v6, v6, Lwjj;->d:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v0, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b0

    :cond_75
    instance-of v9, v6, Lwtn;

    if-eqz v9, :cond_7f

    check-cast v6, Lwtn;

    invoke-virtual {v6, v7}, Lwtn;->f(Lvtn;)V

    goto :goto_b0

    :cond_7f
    new-instance v9, Lwtn;

    invoke-virtual {v7}, Lvtn;->b()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v3}, Lwtn;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v9, v6}, Lwtn;->f(Lvtn;)V

    invoke-virtual {v9, v7}, Lwtn;->f(Lvtn;)V

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v9}, Lwtn;->c()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iget-object v8, p0, Lztn;->h:Ljava/util/HashSet;

    invoke-virtual {v8, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a3

    iput-boolean v4, v9, Lwtn;->e:Z

    :cond_a3
    iget-object v7, p0, Lztn;->g:Lwjj;

    iget-object v7, v7, Lwjj;->d:Ljava/lang/Object;

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    invoke-virtual {v7, v6, v9}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_b0
    move v6, v4

    goto :goto_31

    :cond_b2
    if-nez v6, :cond_c2

    iget-object v5, p0, Lztn;->g:Lwjj;

    iget-object v5, v5, Lwjj;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_c2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1a

    :cond_c6
    :goto_c6
    iget-object v0, p0, Lztn;->g:Lwjj;

    iget-object v0, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_fc

    iget-object v0, p0, Lztn;->g:Lwjj;

    iget-object v0, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvtn;

    instance-of v1, v0, Lwtn;

    if-eqz v1, :cond_fa

    check-cast v0, Lwtn;

    iget-object v1, v0, Lwtn;->f:Ljava/util/ArrayList;

    iget-boolean v0, v0, Lwtn;->e:Z

    if-eqz v0, :cond_fa

    iget-object v0, p0, Lztn;->g:Lwjj;

    iget-object v0, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v0, v3, v1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/2addr v2, v0

    :cond_fa
    add-int/2addr v2, v4

    goto :goto_c6

    :cond_fc
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    invoke-virtual {p0}, Lztn;->J()Z

    move-result v0

    if-eqz v0, :cond_10e

    iget-object p0, p0, Lztn;->b:Ltzi;

    iget-boolean v0, p0, Ltzi;->g:Z

    if-eqz v0, :cond_10e

    invoke-virtual {p0}, Ltzi;->d()V

    :cond_10e
    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lztn;->g:Lwjj;

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Lztn;->g:Lwjj;

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvtn;

    invoke-virtual {p0}, Lvtn;->c()J

    move-result-wide p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lztn;->g:Lwjj;

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvtn;

    invoke-virtual {p0}, Lvtn;->d()Lutn;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    return p0
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p0

    sget-object p1, Lutn;->a:Lutn;

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Lqic;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lqic;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v0, Lgj8;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lgj8;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iput-object p1, p0, Lztn;->l:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    check-cast p1, Ljxn;

    iget-object p0, p0, Lztn;->g:Lwjj;

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvtn;

    invoke-virtual {p1, p0}, Ljxn;->j0(Lvtn;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    sget-object v4, Lutn;->a:Lutn;

    iget-object v4, v0, Lztn;->b:Ltzi;

    if-nez v2, :cond_1e

    new-instance v0, Lixn;

    invoke-static {v3, v1}, Lkf;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object v1

    invoke-direct {v0, v1, v4}, Lixn;-><init>(Lkf;Ltzi;)V

    return-object v0

    :cond_1e
    const/4 v5, 0x1

    const/4 v6, 0x0

    const-string v7, "Missing required view with ID: "

    const v8, 0x7f0a05b8

    const/4 v9, 0x0

    if-ne v2, v5, :cond_93

    new-instance v2, Lfxn;

    const v5, 0x7f0d0206

    invoke-virtual {v3, v5, v1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a01a7

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_82

    const v3, 0x7f0a0534

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v11, :cond_82

    const v3, 0x7f0a0535

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_82

    const v3, 0x7f0a0536

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v13, :cond_82

    const v3, 0x7f0a0537

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v14, :cond_82

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_83

    new-instance v9, Lor2;

    move-object v10, v1

    check-cast v10, Lcom/opera/android/widget/SelectableRelativeLayout;

    const/16 v15, 0xb

    invoke-direct/range {v9 .. v15}, Lor2;-><init>(Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;B)V

    invoke-direct {v2, v9, v4, v0}, Lfxn;-><init>(Lor2;Ltzi;Lztn;)V

    return-object v2

    :cond_82
    move v8, v3

    :cond_83
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v6

    :cond_93
    new-instance v2, Lhxn;

    const v5, 0x7f0d0204

    invoke-virtual {v3, v5, v1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a0538

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v11, :cond_ee

    const v3, 0x7f0a0539

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/custom_views/AutoResizeTextView;

    if-eqz v12, :cond_ee

    const v3, 0x7f0a053a

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v13, :cond_ee

    const v3, 0x7f0a053b

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v14, :cond_ee

    const v3, 0x7f0a0540

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Landroid/widget/FrameLayout;

    if-eqz v15, :cond_ee

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_ef

    new-instance v9, Lpt1;

    move-object v10, v1

    check-cast v10, Lcom/opera/android/widget/SelectableRelativeLayout;

    const/16 v16, 0x7

    invoke-direct/range {v9 .. v16}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    invoke-direct {v2, v9, v4, v0}, Lhxn;-><init>(Lpt1;Ltzi;Lztn;)V

    return-object v2

    :cond_ee
    move v8, v3

    :cond_ef
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v6
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Ljxn;

    invoke-virtual {p1}, Ljxn;->e0()V

    return-void
.end method
