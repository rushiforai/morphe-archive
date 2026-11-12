.class public final Lt93;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "SourceFile"


# instance fields
.field public a:[Ljava/lang/Object;

.field public b:I

.field public final c:Ljava/util/HashMap;

.field public final synthetic d:Ly93;


# direct methods
.method public constructor <init>(Ly93;)V
    .registers 2

    iput-object p1, p0, Lt93;->d:Ly93;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lt93;->c:Ljava/util/HashMap;

    const/4 p1, 0x0

    iput p1, p0, Lt93;->b:I

    return-void
.end method


# virtual methods
.method public final destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 4

    check-cast p3, Lu93;

    iget-object p0, p0, Lt93;->c:Ljava/util/HashMap;

    iget-object p2, p3, Lu93;->c:Ljava/lang/Object;

    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p3, Lu93;->a:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p0, p3, Lu93;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p3, Lu93;->e:Landroidx/recyclerview/widget/d;

    const/4 p2, 0x0

    if-eqz p1, :cond_1a

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    iput-object p2, p3, Lu93;->e:Landroidx/recyclerview/widget/d;

    :cond_1a
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    return-void
.end method

.method public final getCount()I
    .registers 1

    iget p0, p0, Lt93;->b:I

    return p0
.end method

.method public final getItemPosition(Ljava/lang/Object;)I
    .registers 5

    check-cast p1, Lu93;

    iget-object p1, p1, Lu93;->c:Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_5
    iget-object v1, p0, Lt93;->a:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_16

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    return v0

    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_16
    const/4 p0, -0x2

    return p0
.end method

.method public final getPageTitle(I)Ljava/lang/CharSequence;
    .registers 3

    iget-object v0, p0, Lt93;->a:[Ljava/lang/Object;

    aget-object p1, v0, p1

    iget-object p0, p0, Lt93;->d:Ly93;

    invoke-virtual {p0, p1}, Ly93;->K0(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 7

    iget-object v0, p0, Lt93;->a:[Ljava/lang/Object;

    aget-object p2, v0, p2

    iget-object v0, p0, Lt93;->d:Ly93;

    invoke-virtual {v0, p1, p2}, Ly93;->H0(Landroid/view/ViewGroup;Ljava/lang/Object;)Lu93;

    move-result-object v1

    iget-object v2, v1, Lu93;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    iget-object p0, p0, Lt93;->c:Ljava/util/HashMap;

    invoke-virtual {p0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, v1, Lu93;->a:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p0, v1, Lu93;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0, p2, p0}, Ly93;->G0(Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)Landroidx/recyclerview/widget/d;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance p1, Lr8a;

    invoke-virtual {v0, p2}, Ly93;->I0(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, v2, p2}, Lr8a;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object p1, v1, Lu93;->e:Landroidx/recyclerview/widget/d;

    if-eqz p1, :cond_39

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_39
    iput-object p0, v1, Lu93;->e:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-object v1
.end method

.method public final isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 3

    check-cast p2, Lu93;

    iget-object p0, p2, Lu93;->a:Landroid/view/ViewGroup;

    if-ne p1, p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final notifyDataSetChanged()V
    .registers 10

    iget-object v0, p0, Lt93;->d:Ly93;

    invoke-virtual {v0}, Ly93;->L0()[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lt93;->a:[Ljava/lang/Object;

    array-length v2, v1

    iput v2, p0, Lt93;->b:I

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_e
    if-ge v4, v2, :cond_4a

    aget-object v5, v1, v4

    iget-object v6, p0, Lt93;->c:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lu93;

    if-eqz v6, :cond_47

    iget-object v7, v6, Lu93;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v6, Lu93;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0, v5, v8}, Ly93;->G0(Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)Landroidx/recyclerview/widget/d;

    move-result-object v8

    invoke-virtual {v7, v8, v3}, Landroidx/recyclerview/widget/RecyclerView;->M0(Landroidx/recyclerview/widget/d;Z)V

    invoke-virtual {v7, v3}, Landroidx/recyclerview/widget/RecyclerView;->X(I)Liph;

    move-result-object v7

    check-cast v7, Lr8a;

    invoke-virtual {v0, v5}, Ly93;->I0(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v7, Lr8a;->b:Ljava/lang/String;

    const/4 v5, 0x0

    iput-object v5, v7, Lr8a;->e:Landroid/text/StaticLayout;

    iget-object v5, v7, Lr8a;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    iget-object v5, v6, Lu93;->e:Landroidx/recyclerview/widget/d;

    if-eqz v5, :cond_42

    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_42
    iput-object v8, v6, Lu93;->e:Landroidx/recyclerview/widget/d;

    invoke-virtual {v8, v6}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    :cond_47
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_4a
    invoke-super {p0}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    return-void
.end method
