.class public abstract Ll/m7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xh20;


# instance fields
.field public a:Landroidx/core/widget/NestedScrollView;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a()Landroidx/core/widget/NestedScrollView;
.end method

.method public abstract b()Landroidx/recyclerview/widget/RecyclerView;
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m7;->a()Landroidx/core/widget/NestedScrollView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/m7;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/m7;->b()Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/m7;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Ll/m7;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/view/View;

    .line 19
    .line 20
    :cond_0
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-gez v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    instance-of v1, v1, Landroid/view/View;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/view/View;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-ltz v0, :cond_2

    .line 46
    .line 47
    iput-object p1, p0, Ll/m7;->c:Landroid/view/View;

    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onNestedPreScroll(Landroid/view/View;II[II)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/m7;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/m7;->c:Landroid/view/View;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/m7;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    if-eqz p1, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/m7;->e(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    if-lez p3, :cond_2

    .line 18
    .line 19
    iget-object p5, p0, Ll/m7;->c:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p5}, Landroid/view/View;->getTop()I

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    invoke-virtual {p0}, Ll/m7;->c()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-le p5, v0, :cond_3

    .line 30
    .line 31
    iget-object p5, p0, Ll/m7;->c:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p5}, Landroid/view/View;->getTop()I

    .line 34
    .line 35
    .line 36
    move-result p5

    .line 37
    invoke-virtual {p0}, Ll/m7;->c()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    sub-int/2addr p5, v0

    .line 42
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-le p5, v0, :cond_1

    .line 47
    .line 48
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 49
    .line 50
    .line 51
    move-result p5

    .line 52
    aput p5, p4, p2

    .line 53
    .line 54
    iget-object p0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 55
    .line 56
    invoke-virtual {p0, p1, p3}, Landroid/view/View;->scrollBy(II)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    sub-int/2addr p3, p5

    .line 61
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 62
    .line 63
    .line 64
    move-result p5

    .line 65
    aput p5, p4, p2

    .line 66
    .line 67
    iget-object p0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 68
    .line 69
    invoke-virtual {p0, p1, p3}, Landroid/view/View;->scrollBy(II)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    iget-object p5, p0, Ll/m7;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 74
    .line 75
    invoke-virtual {p5, p2}, Landroid/view/View;->canScrollVertically(I)Z

    .line 76
    .line 77
    .line 78
    move-result p5

    .line 79
    if-nez p5, :cond_3

    .line 80
    .line 81
    neg-int p3, p3

    .line 82
    aput p3, p4, p2

    .line 83
    .line 84
    iget-object p0, p0, Ll/m7;->a:Landroidx/core/widget/NestedScrollView;

    .line 85
    .line 86
    invoke-virtual {p0, p1, p3}, Landroid/view/View;->scrollBy(II)V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 2
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIIII)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;II)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;II)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/m7;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/m7;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    iget-object p2, p0, Ll/m7;->c:Landroid/view/View;

    .line 12
    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/m7;->e(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return p1
.end method

.method public onStopNestedScroll(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method
