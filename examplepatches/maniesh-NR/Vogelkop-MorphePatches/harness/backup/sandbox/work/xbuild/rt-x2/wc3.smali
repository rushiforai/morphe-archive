.class public final Lwc3;
.super Ly1c;
.source "SourceFile"


# instance fields
.field public final synthetic g:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic h:Landroidx/recyclerview/widget/f;

.field public final synthetic i:Lzc3;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/f;Lqsh;Lzc3;)V
    .registers 5

    iput-object p1, p0, Lwc3;->g:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lwc3;->h:Landroidx/recyclerview/widget/f;

    iput-object p4, p0, Lwc3;->i:Lzc3;

    check-cast p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {p0, p1, p2, p3}, Ly1c;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;Lqsh;)V

    return-void
.end method


# virtual methods
.method public final calculateTimeForDeceleration(I)I
    .registers 3

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    iget-object v0, p0, Lwc3;->i:Lzc3;

    iget-object v0, v0, Lzc3;->e:Lpn7;

    if-eqz v0, :cond_12

    iget-wide p0, v0, Lpn7;->a:J

    invoke-static {p0, p1}, Lpn7;->f(J)J

    move-result-wide p0

    long-to-int p0, p0

    return p0

    :cond_12
    invoke-super {p0, p1}, Lifc;->calculateTimeForDeceleration(I)I

    move-result p0

    return p0
.end method

.method public final onTargetFound(Landroid/view/View;Lvph;Lsph;)V
    .registers 6

    iget-object p2, p0, Lwc3;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    iget-object v0, p0, Lwc3;->h:Landroidx/recyclerview/widget/f;

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2f

    iget-object p2, p0, Lwc3;->i:Lzc3;

    invoke-virtual {p2, v0, p1}, Lzc3;->calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/f;Landroid/view/View;)[I

    move-result-object p1

    const/4 p2, 0x0

    aget p2, p1, p2

    const/4 v0, 0x1

    aget p1, p1, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lwc3;->calculateTimeForDeceleration(I)I

    move-result v0

    if-lez v0, :cond_2f

    iget-object p0, p0, Lifc;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, p2, p1, v0, p0}, Lsph;->b(IIILandroid/view/animation/Interpolator;)V

    :cond_2f
    return-void
.end method
