.class public final Lkue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public final c:Landroid/view/View;

.field public final d:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

.field public final e:Lx93;

.field public f:Ljava/util/List;

.field public g:Lz4k;

.field public final h:Ljava/util/HashSet;

.field public final i:Ljue;

.field public final j:Ljue;

.field public final k:Ljava/util/List;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lx93;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lx93;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lkue;->e:Lx93;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lkue;->f:Ljava/util/List;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lkue;->h:Ljava/util/HashSet;

    new-instance v1, Ljue;

    new-instance v2, Lrqd;

    const/16 v3, 0x14

    invoke-direct {v2, v3}, Lrqd;-><init>(B)V

    invoke-direct {v1, p0, v2}, Ljue;-><init>(Lkue;Lurg;)V

    iput-object v1, p0, Lkue;->i:Ljue;

    new-instance v2, Ljue;

    new-instance v3, Lrqd;

    const/16 v4, 0x15

    invoke-direct {v3, v4}, Lrqd;-><init>(B)V

    invoke-direct {v2, p0, v3}, Ljue;-><init>(Lkue;Lurg;)V

    iput-object v2, p0, Lkue;->j:Ljue;

    filled-new-array {v1, v2}, [Ljue;

    move-result-object v1

    invoke-static {v1}, Lnb6;->K([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lkue;->k:Ljava/util/List;

    iput-object p1, p0, Lkue;->c:Landroid/view/View;

    iput-object p2, p0, Lkue;->d:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object v1, p2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->a:Ll2c;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ll2c;->d(I)V

    invoke-virtual {v1}, Ll2c;->b()Z

    move-result v1

    iput-boolean v1, p0, Lkue;->l:Z

    const v1, 0x7f0a0764

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v1, p0, Lkue;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/view/View;->setHorizontalFadingEdgeEnabled(Z)V

    const v3, 0x7f0a0765

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v3, Luuj;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const/high16 v5, 0x42400000    # 48.0f

    invoke-static {v4, v5}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput v4, v3, Luuj;->a:I

    new-instance v4, Lxh5;

    new-instance v5, Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-direct {v4, v5}, Lxh5;-><init>(Landroid/view/View;)V

    iput-object v4, v3, Luuj;->b:Ljava/lang/Object;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v3, Luuj;->c:Ljava/lang/Object;

    invoke-virtual {p2, v4}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    new-instance v4, Lz22;

    const/16 v5, 0x11

    invoke-direct {v4, v3, v5}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance p2, Lwwl;

    invoke-direct {p2, p1}, Lwwl;-><init>(Lcom/opera/android/custom_views/StylingImageView;)V

    iget-object v4, v3, Luuj;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, v3, Luuj;->b:Ljava/lang/Object;

    check-cast v3, Lxh5;

    iget-object p2, p2, Lwwl;->c:Landroid/view/TouchDelegate;

    iget-object v3, v3, Lxh5;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p2, Ldge;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p2, v2, v2}, Ldge;-><init>(IZ)V

    invoke-virtual {v1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance p2, Lzvd;

    invoke-direct {p2, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 5

    iget v0, p0, Lkue;->a:I

    iget-object v1, p0, Lkue;->g:Lz4k;

    if-ne p1, v0, :cond_17

    iget-object p0, v1, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lc5k;

    invoke-virtual {p0}, Lc5k;->f()V

    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_16

    invoke-virtual {p0}, Lxw8;->g()V

    :cond_16
    return-void

    :cond_17
    iget-object v0, v1, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lc5k;

    iget-object v1, v0, Lc5k;->y:Lzxf;

    invoke-virtual {v1}, Lzxf;->e()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, p1, :cond_2e

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbwf;

    goto :goto_2f

    :cond_2e
    const/4 v1, 0x0

    :goto_2f
    if-eqz v1, :cond_3b

    iget-object v0, v0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p1

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_3b
    iget-object p0, p0, Lkue;->g:Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lc5k;

    invoke-virtual {p0}, Lc5k;->f()V

    return-void
.end method

.method public final b(IZ)V
    .registers 6

    iget v0, p0, Lkue;->a:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lkue;->a:I

    iget-object v1, p0, Lkue;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p2, :cond_f

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    goto :goto_12

    :cond_f
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :goto_12
    iget-object p1, p0, Lkue;->h:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_18
    :goto_18
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lhue;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_18

    iget-object v2, p2, Lhue;->b:Lkue;

    iget v2, v2, Lkue;->a:I

    if-ne v1, v2, :cond_33

    const/4 v1, 0x1

    goto :goto_34

    :cond_33
    const/4 v1, 0x0

    :goto_34
    iget-object p2, p2, Lhue;->c:Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {p2, v1}, Landroid/view/View;->setSelected(Z)V

    goto :goto_18

    :cond_3a
    iget-object p1, p0, Lkue;->e:Lx93;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    iget p0, p0, Lkue;->a:I

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    return-void
.end method
