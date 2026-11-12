.class public final Lzld;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Lxbf;

.field public final c:Lz0c;

.field public final d:Lwe7;

.field public final e:Lmig;

.field public final f:Lfql;

.field public g:Ljava/util/List;

.field public h:Ljava/util/List;

.field public i:Z


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lxbf;Lz0c;)V
    .registers 7

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Lxld;

    invoke-direct {v0, p0}, Lxld;-><init>(Lzld;)V

    new-instance v1, Lwe7;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v0, v2}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v1, p0, Lzld;->d:Lwe7;

    new-instance v0, Lmig;

    new-instance v1, Lyld;

    invoke-direct {v1, p0}, Lyld;-><init>(Lzld;)V

    invoke-direct {v0, v1}, Lmig;-><init>(Llig;)V

    iput-object v0, p0, Lzld;->e:Lmig;

    new-instance v0, Lfql;

    invoke-direct {v0}, Lfql;-><init>()V

    iput-object v0, p0, Lzld;->f:Lfql;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lzld;->g:Ljava/util/List;

    iput-object v0, p0, Lzld;->h:Ljava/util/List;

    iput-object p1, p0, Lzld;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lzld;->b:Lxbf;

    iput-object p3, p0, Lzld;->c:Lz0c;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    invoke-virtual {p0}, Lzld;->H()V

    return-void
.end method


# virtual methods
.method public final G()V
    .registers 3

    iget-object v0, p0, Lzld;->b:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    if-eqz v0, :cond_20

    iget-object v1, p0, Lzld;->h:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_20

    iget-object p0, p0, Lzld;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_20
    return-void
.end method

.method public final H()V
    .registers 5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lzld;->i:Z

    iget-object v1, p0, Lzld;->b:Lxbf;

    iget-object v1, v1, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_14
    invoke-interface {v1}, Lgig;->p()I

    move-result v3

    if-ge v0, v3, :cond_24

    invoke-interface {v1, v0}, Lgig;->Q(I)Lqjd;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_24
    iput-object v2, p0, Lzld;->g:Ljava/util/List;

    invoke-interface {v1}, Lgig;->getShuffleModeEnabled()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-static {v1}, Lw7d;->C(Lgig;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_33

    :cond_31
    iget-object v0, p0, Lzld;->g:Ljava/util/List;

    :goto_33
    iput-object v0, p0, Lzld;->h:Ljava/util/List;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lzld;->h:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Lzld;->h:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqjd;

    invoke-virtual {p0}, Lqjd;->hashCode()I

    move-result p0

    int-to-long p0, p0

    return-wide p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 8

    check-cast p1, Lcmd;

    iget-object v0, p0, Lzld;->h:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjd;

    iget-object v1, p0, Lzld;->h:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqjd;

    iget-object v1, p0, Lzld;->b:Lxbf;

    iget-object v1, v1, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    invoke-interface {v1}, Lgig;->getCurrentTimeline()Lgql;

    move-result-object v1

    iget-object v2, p0, Lzld;->g:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iget-object p0, p0, Lzld;->f:Lfql;

    invoke-virtual {v1, v2, p0}, Lgql;->n(ILfql;)V

    iget-wide v1, p0, Lfql;->l:J

    invoke-static {v1, v2}, Ltym;->c0(J)J

    move-result-wide v1

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long p0, v1, v3

    if-nez p0, :cond_4a

    iget-object p0, p2, Lqjd;->e:Lvjd;

    iget-object p0, p0, Lvjd;->I:Landroid/os/Bundle;

    if-eqz p0, :cond_49

    const-string p2, "android.media.metadata.DURATION"

    invoke-virtual {p0, p2, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    goto :goto_4a

    :cond_49
    move-wide v1, v3

    :cond_4a
    :goto_4a
    iput-object v0, p1, Lcmd;->e:Lqjd;

    iput-wide v1, p1, Lcmd;->f:J

    iget-object p0, p1, Lcmd;->c:Lor2;

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p2, v0, Lqjd;->e:Lvjd;

    iget-object p2, p2, Lvjd;->a:Ljava/lang/CharSequence;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Lcmd;->b:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    invoke-virtual {p0, v0}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object p0

    iput-object p0, p1, Lcmd;->g:Lkg7;

    invoke-virtual {p1}, Lcmd;->U()V

    invoke-virtual {p1}, Lcmd;->V()V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    new-instance p2, Lcmd;

    const v0, 0x7f0d028c

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lyzb;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lzld;->c:Lz0c;

    iget-object p0, p0, Lzld;->b:Lxbf;

    invoke-direct {p2, p0, p1, v0, v1}, Lcmd;-><init>(Lxbf;Landroid/view/View;Lyzb;Lz0c;)V

    return-object p2
.end method
