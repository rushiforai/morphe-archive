.class public final Ldvc;
.super Llj;
.source "SourceFile"


# instance fields
.field public final r:Lpyl;

.field public final s:Lyqa;

.field public t:Lgvc;

.field public u:Lcom/opera/android/custom_views/ActionBarSearchView;

.field public v:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lfqe;Lx77;Lyqa;)V
    .registers 6

    const v0, 0x7f0d0389

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    const v1, 0x7f14042a

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x0

    iput v1, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lpyl;

    invoke-direct {v0, p1, p2}, Lpyl;-><init>(Lfqe;Lx77;)V

    iput-object v0, p0, Ldvc;->r:Lpyl;

    iput-object p3, p0, Ldvc;->s:Lyqa;

    return-void
.end method


# virtual methods
.method public final onDestroyView()V
    .registers 3

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Ldvc;->v:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iput-object v1, p0, Ldvc;->v:Landroid/widget/TextView;

    :cond_d
    iget-object v0, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz v0, :cond_16

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    iput-object v1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    :cond_16
    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 8

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0269

    invoke-static {p2, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    new-instance v1, Lgvc;

    new-instance v2, Lbvc;

    invoke-direct {v2, p0}, Lbvc;-><init>(Ldvc;)V

    iget-object v3, p0, Ldvc;->r:Lpyl;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v3, v3, Lpyl;->c:Ljava/lang/Object;

    check-cast v3, Lx77;

    iget-object v3, v3, Lx77;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v1, v2, v4}, Lgvc;-><init>(Lbvc;Ljava/util/ArrayList;)V

    iput-object v1, p0, Ldvc;->t:Lgvc;

    const v1, 0x7f0d0387

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v0, 0x7f0a061b

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v1, :cond_dc

    const v0, 0x7f0a0837

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/AnimationEmptyListView;

    if-eqz v3, :cond_dc

    const v0, 0x7f0a08c1

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    if-eqz v3, :cond_dc

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance p1, Lbvc;

    invoke-direct {p1, p0}, Lbvc;-><init>(Ldvc;)V

    invoke-virtual {v3, p1}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a(Lzph;)V

    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    iget-object p1, p0, Ldvc;->t:Lgvc;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Ldvc;->t:Lgvc;

    new-instance v0, Lcvc;

    invoke-direct {v0, v3}, Lyph;-><init>(Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    const p1, 0x7f0a0934

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/ActionBarSearchView;

    iput-object p1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    const p2, 0x7f140429

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    new-instance p2, Lwub;

    invoke-direct {p2, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    iget-object p1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    const p2, 0x7f0a0939

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    iput v2, p2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    const p2, 0x7f0a0946

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ldvc;->v:Landroid/widget/TextView;

    if-eqz p1, :cond_db

    iget-object p1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    new-instance p2, Llzb;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object p1, p0, Ldvc;->v:Landroid/widget/TextView;

    new-instance p2, Ly39;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ly39;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    :cond_db
    return-void

    :cond_dc
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
