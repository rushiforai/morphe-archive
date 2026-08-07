.class public Ll/v6u;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"

# interfaces
.implements Ll/rft$b;


# instance fields
.field public j:Z

.field public k:Landroidx/recyclerview/widget/RecyclerView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:Ll/rft;

.field public m:Ll/dtl;

.field public final n:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/v6u;->j:Z

    .line 6
    .line 7
    new-instance v0, Ll/v6u$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/v6u$a;-><init>(Ll/v6u;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/v6u;->n:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic e0()Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic f0(Ll/v6u;ZLl/d3q;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v6u;->j0(ZLl/d3q;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/android/app/Frag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static bridge synthetic h0(Ll/v6u;)Ll/rft;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6u;->l:Ll/rft;

    return-object p0
.end method


# virtual methods
.method public i0()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v6u;->l:Ll/rft;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rft;->m()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/v6u;->l:Ll/rft;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/v6u;->n:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final synthetic j0(ZLl/d3q;)V
    .locals 1

    .line 1
    new-instance v0, Ll/j80;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j80;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/j80;->d(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2, v0}, Ll/d3q;->F(Ll/j80;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/v6u;->m:Ll/dtl;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0, p2, v0}, Ll/dtl;->a(Ll/d3q;Ll/j80;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public k0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/v6u;->n:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l0(Ll/ner;)V
    .locals 2

    .line 1
    new-instance v0, Ll/u6u;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u6u;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v1, p1, v0}, Ll/v6u;->m0(Ll/dtl;Ll/ner;Ll/pcj;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/t6u;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2}, Ll/t6u;-><init>(Ll/v6u;Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1, v1}, Ll/x7s;->s0(Ljava/util/List;Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m0(Ll/dtl;Ll/ner;Ll/pcj;)V
    .locals 2
    .param p1    # Ll/dtl;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/ner;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/pcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dtl;",
            "Ll/ner;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v6u;->m:Ll/dtl;

    .line 2
    .line 3
    iget-object p1, p0, Ll/v6u;->l:Ll/rft;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/rft;->w()V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p1, Ll/rft;

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/v6u;->j:Z

    .line 13
    .line 14
    const/high16 v1, 0x3f000000    # 0.5f

    .line 15
    .line 16
    invoke-direct {p1, v0, p2, p3, v1}, Ll/rft;-><init>(ZLl/ner;Ll/pcj;F)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/v6u;->l:Ll/rft;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ll/rft;->s(Ll/rft$b;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/v6u;->l:Ll/rft;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/rft;->k(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public n0(Lcom/p1/mobile/android/app/Frag;Lrx/subjects/b;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Frag;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/s6u;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/s6u;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v1, p1, v0}, Ll/v6u;->m0(Ll/dtl;Ll/ner;Ll/pcj;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/v6u;->l:Ll/rft;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/rft;->r(Lcom/p1/mobile/android/app/Frag;Lrx/subjects/b;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public o0(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Lrx/subjects/b;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Frag;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/pcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Ll/v6u;->m0(Ll/dtl;Ll/ner;Ll/pcj;)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/v6u;->l:Ll/rft;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p3}, Ll/rft;->r(Lcom/p1/mobile/android/app/Frag;Lrx/subjects/b;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/v6u;->l:Ll/rft;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/rft;->k(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iput-object p1, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    return-void
.end method

.method public onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/v6u;->l:Ll/rft;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/rft;->w()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    return-void
.end method

.method public declared-synchronized p0()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/v6u;->l:Ll/rft;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/rft;->u()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public declared-synchronized q0()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/v6u;->l:Ll/rft;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/rft;->v()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method
