.class public final Lblh;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Lkkm;
.implements Llkm;


# instance fields
.field public final a:Lglh;

.field public final b:Lzg7;

.field public final c:Ltzi;

.field public final d:Le5d;

.field public final e:Lxvj;

.field public final f:Ljava/util/HashMap;

.field public final g:Lxkh;

.field public final h:Ljava/util/ArrayList;

.field public i:Ll46;

.field public final j:Lnlh;

.field public final k:Lvi7;


# direct methods
.method public constructor <init>(Lglh;Lzg7;Ltzi;Lnlh;Lvi7;ILjava/util/ArrayList;)V
    .registers 9

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lblh;->f:Ljava/util/HashMap;

    iput-object p1, p0, Lblh;->a:Lglh;

    iput-object p2, p0, Lblh;->b:Lzg7;

    iput-object p3, p0, Lblh;->c:Ltzi;

    iput-object p4, p0, Lblh;->j:Lnlh;

    iput-object p5, p0, Lblh;->k:Lvi7;

    iget-object p1, p3, Ltzi;->a:Le5d;

    iput-object p1, p0, Lblh;->d:Le5d;

    new-instance p1, Lxkh;

    invoke-direct {p1, p0}, Lyvj;-><init>(Landroidx/recyclerview/widget/d;)V

    iput p6, p1, Lxkh;->b:I

    iput-object p1, p0, Lblh;->g:Lxkh;

    new-instance p2, Lxvj;

    const-class p3, Lwkh;

    invoke-direct {p2, p3, p1}, Lxvj;-><init>(Ljava/lang/Class;Lyvj;)V

    iput-object p2, p0, Lblh;->e:Lxvj;

    iput-object p7, p0, Lblh;->h:Ljava/util/ArrayList;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final G()Ljava/util/ArrayList;
    .registers 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_6
    iget-object v2, p0, Lblh;->e:Lxvj;

    iget v3, v2, Lxvj;->h:I

    if-ge v1, v3, :cond_2c

    invoke-virtual {v2, v1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwkh;

    iget-object v2, v2, Lwkh;->a:Lilh;

    iget-wide v3, v2, Lilh;->a:J

    iget-object v5, p0, Lblh;->d:Le5d;

    iget-object v5, v5, Le5d;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/LinkedHashSet;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_2c
    return-object v0
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_d
    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lilh;

    iget-wide v1, v1, Lilh;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p0, Lblh;->f:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwkh;

    if-eqz v1, :cond_d

    iget-object v2, p0, Lblh;->e:Lxvj;

    invoke-virtual {v2, v1}, Lxvj;->g(Ljava/lang/Object;)V

    iget-object v1, v1, Lwkh;->a:Lilh;

    new-instance v2, Lguh;

    const/4 v3, -0x1

    invoke-direct {v2, v1, v3}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_3a
    new-instance p0, Le5d;

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v1, 0x2

    invoke-direct {p0, v0, p1, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0
.end method

.method public final O(Ll46;)V
    .registers 2

    iput-object p1, p0, Lblh;->i:Ll46;

    return-void
.end method

.method public final R(Ljava/util/ArrayList;)V
    .registers 9

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_6
    :goto_6
    iget-object v3, p0, Lblh;->f:Ljava/util/HashMap;

    if-ge v2, v0, :cond_2a

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lilh;

    iget-wide v5, v4, Lilh;->a:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwkh;

    if-eqz v5, :cond_6

    iget-wide v4, v4, Lilh;->a:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_2a
    iget-object v0, p0, Lblh;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_30
    :goto_30
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_30

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_30

    :cond_44
    iget-object v2, p0, Lblh;->b:Lzg7;

    iget-object v2, v2, Lzg7;->m:Lati;

    check-cast v2, Lv8f;

    iget-object v2, v2, Lv8f;->a:Lglh;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {p1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    :goto_5b
    if-ge v1, v4, :cond_6f

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v1, v1, 0x1

    check-cast v5, Lilh;

    iget-wide v5, v5, Lilh;->a:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5b

    :cond_6f
    const/4 p1, 0x1

    invoke-virtual {v2, v3, p1}, Lglh;->a(Ljava/util/Collection;Z)V

    iget-object p0, p0, Lblh;->j:Lnlh;

    invoke-virtual {p0, v0}, Lnlh;->L0(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lblh;->e:Lxvj;

    iget p0, p0, Lxvj;->h:I

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Lblh;->e:Lxvj;

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwkh;

    iget-object p0, p0, Lwkh;->a:Lilh;

    iget-wide p0, p0, Lilh;->a:J

    return-wide p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 10

    check-cast p1, Lalh;

    iget-object p0, p0, Lblh;->e:Lxvj;

    invoke-virtual {p0, p2}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwkh;

    sget p2, Lalh;->m:I

    iput-object p0, p1, Lalh;->j:Lwkh;

    iget-object p0, p0, Lwkh;->a:Lilh;

    iget-object p2, p1, Lalh;->i:Lpt1;

    iget-object v0, p2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p2, Lpt1;->b:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, p0, Lilh;->c:Ljava/lang/String;

    iget-object v3, p0, Lilh;->e:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lilh;->b:Ljava/lang/String;

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2e

    move-object v0, v2

    :cond_2e
    iget-object v2, p0, Lilh;->i:Ljava/lang/Long;

    invoke-static {v0}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v2, :cond_3a

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_56

    :cond_3a
    iget-object v4, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6, v4}, Laik;->i(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2, v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f140bb3

    invoke-virtual {v4, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_56
    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07080b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object p2, p2, Lpt1;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v1, p1, Lalh;->l:Lblh;

    iget-object v1, v1, Lblh;->a:Lglh;

    iget-wide v4, p0, Lilh;->a:J

    iget-object v1, v1, Lglh;->g:Ljava/util/HashSet;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7b

    const/4 v1, 0x0

    goto :goto_7d

    :cond_7b
    const/16 v1, 0x8

    :goto_7d
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_a0

    const/4 p2, 0x0

    iput-object p2, p1, Lalh;->k:Lp8i;

    iget-object p2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lilh;->b:Ljava/lang/String;

    sget p0, Lvmj;->g:I

    const/4 v4, 0x0

    const/16 v5, 0x3c

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    invoke-virtual {p1, p0}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c2

    :cond_a0
    sget-object p2, Lyne;->b:Ldeg;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ldeg;->h(Ljava/io/File;)Ldwh;

    move-result-object p2

    iget-object v1, p2, Ldwh;->b:Lgvh;

    invoke-virtual {v1, v0, v0}, Lgvh;->b(II)V

    invoke-virtual {p2}, Ldwh;->j()V

    new-instance v0, Lphi;

    new-instance v1, Leof;

    const/16 v2, 0xa

    invoke-direct {v1, p1, p0, v2}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {p2, v0}, Ldwh;->f(Lacl;)V

    :goto_c2
    invoke-virtual {p1}, Lalh;->h0()V

    invoke-virtual {p1}, Lak7;->U()V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    new-instance p2, Ldkf;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1501b2

    invoke-direct {p2, v0, v1}, Ldkf;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lalh;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-static {p2, p1}, Lpt1;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpt1;

    move-result-object p1

    iget-object p2, p0, Lblh;->c:Ltzi;

    invoke-direct {v0, p0, p1, p2}, Lalh;-><init>(Lblh;Lpt1;Ltzi;)V

    return-object v0
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lalh;

    invoke-virtual {p1}, Lalh;->e0()V

    return-void
.end method

.method public final t(Le5d;)V
    .registers 5

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_e
    if-ltz v0, :cond_32

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lguh;

    iget-object v1, v1, Lguh;->a:Ljava/lang/Object;

    check-cast v1, Lilh;

    iget-wide v1, v1, Lilh;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p0, Lblh;->f:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwkh;

    if-eqz v1, :cond_2f

    iget-object v2, p0, Lblh;->e:Lxvj;

    invoke-virtual {v2, v1}, Lxvj;->a(Ljava/lang/Object;)I

    :cond_2f
    add-int/lit8 v0, v0, -0x1

    goto :goto_e

    :cond_32
    return-void
.end method
