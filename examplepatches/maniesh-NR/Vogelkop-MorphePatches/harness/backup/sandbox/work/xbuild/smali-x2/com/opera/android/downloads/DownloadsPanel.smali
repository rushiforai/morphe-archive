.class public Lcom/opera/android/downloads/DownloadsPanel;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:Lp12;

.field public c:Lug7;

.field public d:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 6

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v0

    iget-object v0, v0, Ltjg;->o:Lxbf;

    if-eqz v0, :cond_1c

    iget-object v0, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lp12;

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    iput-object v0, p0, Lcom/opera/android/downloads/DownloadsPanel;->b:Lp12;

    if-eqz v0, :cond_53

    iget-object v1, p0, Lcom/opera/android/downloads/DownloadsPanel;->c:Lug7;

    iget-object p0, p0, Lcom/opera/android/downloads/DownloadsPanel;->d:Landroid/view/ViewGroup;

    iget-object v2, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v2, Lxbf;

    iget-object v3, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewGroup;

    const/4 v4, 0x1

    if-eqz v3, :cond_32

    move v3, v4

    goto :goto_33

    :cond_32
    const/4 v3, 0x0

    :goto_33
    if-eqz v3, :cond_38

    invoke-virtual {v0}, Lp12;->j()V

    :cond_38
    iput-object v1, v0, Lp12;->e:Ljava/lang/Object;

    iput-object p0, v0, Lp12;->b:Ljava/lang/Object;

    if-nez v3, :cond_50

    iget-object p0, v0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Lwe7;

    invoke-virtual {p0, v2}, Lhkg;->a(Lxbf;)V

    iget-object p0, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object v1, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v1, Luld;

    invoke-virtual {p0, v1}, Ltjg;->a(Lrjg;)V

    :cond_50
    invoke-virtual {v0, v4}, Lp12;->B(Z)V

    :cond_53
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/downloads/DownloadsPanel;->b:Lp12;

    if-eqz v0, :cond_2c

    iget-object v1, p0, Lcom/opera/android/downloads/DownloadsPanel;->d:Landroid/view/ViewGroup;

    iget-object v2, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v2, Lxbf;

    iget-object v3, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewGroup;

    const/4 v4, 0x0

    if-ne v3, v1, :cond_2a

    invoke-virtual {v0}, Lp12;->j()V

    iget-object v1, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Ltjg;

    iget-object v3, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v3, Luld;

    invoke-virtual {v1, v3}, Ltjg;->i(Lrjg;)V

    iget-object v1, v0, Lp12;->g:Ljava/lang/Object;

    check-cast v1, Lwe7;

    invoke-virtual {v1, v2}, Lhkg;->b(Lxbf;)V

    iput-object v4, v0, Lp12;->b:Ljava/lang/Object;

    iput-object v4, v0, Lp12;->e:Ljava/lang/Object;

    :cond_2a
    iput-object v4, p0, Lcom/opera/android/downloads/DownloadsPanel;->b:Lp12;

    :cond_2c
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a0337

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/opera/android/downloads/DownloadsPanel;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    new-instance v1, Lcom/opera/android/widget/SnapToTopLinearLayoutManager;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v0, Lxr6;

    invoke-direct {v0}, Lxr6;-><init>()V

    const/4 v1, 0x0

    iput-boolean v1, v0, Lxkj;->g:Z

    iget-object v1, p0, Lcom/opera/android/downloads/DownloadsPanel;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a06c2

    invoke-static {p0, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/opera/android/downloads/DownloadsPanel;->d:Landroid/view/ViewGroup;

    return-void
.end method
