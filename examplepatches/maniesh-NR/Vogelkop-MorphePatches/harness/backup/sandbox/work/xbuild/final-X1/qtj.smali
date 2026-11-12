.class public abstract Lqtj;
.super Lzwg;
.source "SourceFile"


# static fields
.field static final MILLISECONDS_PER_INCH:F = 100.0f


# instance fields
.field private mGravityScroller:Landroid/widget/Scroller;

.field mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private final mScrollListener:Loph;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lvm3;

    invoke-direct {v0, p0}, Lvm3;-><init>(Lqtj;)V

    iput-object v0, p0, Lqtj;->mScrollListener:Loph;

    return-void
.end method


# virtual methods
.method public attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v0, p1, :cond_3c

    if-eqz v0, :cond_10

    iget-object v1, p0, Lqtj;->mScrollListener:Loph;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Lzwg;

    :cond_10
    iput-object p1, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_3c

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->V:Lzwg;

    if-nez v0, :cond_37

    iget-object v0, p0, Lqtj;->mScrollListener:Loph;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    iget-object p1, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p0, p1, Landroidx/recyclerview/widget/RecyclerView;->V:Lzwg;

    new-instance p1, Landroid/widget/Scroller;

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-direct {p1, v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lqtj;->mGravityScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lqtj;->snapToTargetExistingView()V

    return-void

    :cond_37
    const-string p0, "An instance of OnFlingListener already set."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_3c
    return-void
.end method

.method public calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/f;Landroid/view/View;)[I
    .registers 4

    instance-of p0, p1, Lcom/google/android/material/carousel/CarouselLayoutManager;

    const/4 v0, 0x0

    if-nez p0, :cond_a

    filled-new-array {v0, v0}, [I

    move-result-object p0

    return-object p0

    :cond_a
    move-object p0, p1

    check-cast p0, Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/f;->getPosition(Landroid/view/View;)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->y(I)I

    move-result p2

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->C()Z

    move-result p0

    if-eqz p0, :cond_20

    filled-new-array {p2, v0}, [I

    move-result-object p0

    return-object p0

    :cond_20
    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result p0

    if-eqz p0, :cond_2b

    filled-new-array {v0, p2}, [I

    move-result-object p0

    return-object p0

    :cond_2b
    filled-new-array {v0, v0}, [I

    move-result-object p0

    return-object p0
.end method

.method public calculateScrollDistance(II)[I
    .registers 12
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnknownNullness"
        }
    .end annotation

    iget-object v0, p0, Lqtj;->mGravityScroller:Landroid/widget/Scroller;

    const/high16 v7, -0x80000000

    const v8, 0x7fffffff

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/high16 v5, -0x80000000

    const v6, 0x7fffffff

    move v3, p1

    move v4, p2

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    iget-object p1, p0, Lqtj;->mGravityScroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalX()I

    move-result p1

    iget-object p0, p0, Lqtj;->mGravityScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Landroid/widget/Scroller;->getFinalY()I

    move-result p0

    filled-new-array {p1, p0}, [I

    move-result-object p0

    return-object p0
.end method

.method public createScroller(Landroidx/recyclerview/widget/f;)Luph;
    .registers 4

    instance-of p1, p1, Ltph;

    if-nez p1, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance p1, Lmxf;

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, v1}, Lmxf;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    return-object p1
.end method

.method public createSnapScroller(Landroidx/recyclerview/widget/f;)Lifc;
    .registers 4
    .param p1    # Landroidx/recyclerview/widget/f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    instance-of p1, p1, Ltph;

    if-nez p1, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance p1, Lmxf;

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, v1}, Lmxf;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    return-object p1
.end method

.method public abstract findSnapView(Landroidx/recyclerview/widget/f;)Landroid/view/View;
.end method

.method public abstract findTargetSnapPosition(Landroidx/recyclerview/widget/f;II)I
.end method

.method public onFling(II)Z
    .registers 6

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v1, :cond_29

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v2, :cond_29

    iget v0, v0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-gt v2, v0, :cond_18

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-le v2, v0, :cond_29

    :cond_18
    instance-of v0, v1, Ltph;

    if-eqz v0, :cond_29

    invoke-virtual {p0, v1}, Lqtj;->createScroller(Landroidx/recyclerview/widget/f;)Luph;

    move-result-object v0

    if-eqz v0, :cond_29

    invoke-virtual {p0, v1, p1, p2}, Lqtj;->findTargetSnapPosition(Landroidx/recyclerview/widget/f;II)I

    move-result p0

    const/4 p1, -0x1

    if-ne p0, p1, :cond_2b

    :cond_29
    const/4 p0, 0x0

    return p0

    :cond_2b
    invoke-virtual {v0, p0}, Luph;->setTargetPosition(I)V

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    const/4 p0, 0x1

    return p0
.end method

.method public snapToTargetExistingView()V
    .registers 6

    iget-object v0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_1c

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v0, :cond_1c

    invoke-virtual {p0, v0}, Lqtj;->findSnapView(Landroidx/recyclerview/widget/f;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1c

    invoke-virtual {p0, v0, v1}, Lqtj;->calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/f;Landroid/view/View;)[I

    move-result-object v0

    const/4 v1, 0x0

    aget v2, v0, v1

    const/4 v3, 0x1

    if-nez v2, :cond_1d

    aget v4, v0, v3

    if-nez v4, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    iget-object p0, p0, Lqtj;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    aget v0, v0, v3

    invoke-virtual {p0, v2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->G0(IIZ)V

    return-void
.end method
