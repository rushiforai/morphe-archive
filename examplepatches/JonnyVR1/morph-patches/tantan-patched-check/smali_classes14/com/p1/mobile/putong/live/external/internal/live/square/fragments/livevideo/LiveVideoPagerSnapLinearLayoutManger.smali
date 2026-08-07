.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$q;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Landroidx/recyclerview/widget/s;

.field public c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroidx/recyclerview/widget/s;

    .line 5
    .line 6
    invoke-direct {p1}, Landroidx/recyclerview/widget/s;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->b:Landroidx/recyclerview/widget/s;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 2
    .line 3
    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->a:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    :try_start_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;->a(ZI)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;->a(ZI)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    :cond_1
    return-void
.end method

.method public canScrollVertically()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public d(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;->onPageSelected(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;->b(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->b:Landroidx/recyclerview/widget/s;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/w;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->b:Landroidx/recyclerview/widget/s;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/s;->h(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->c:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;->onPageSelected(I)V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onScrollStateChanged(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->a:I

    .line 2
    .line 3
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
