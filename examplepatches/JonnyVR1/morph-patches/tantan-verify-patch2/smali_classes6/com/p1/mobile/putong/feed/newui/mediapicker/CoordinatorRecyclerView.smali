.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public c:F

.field public d:Ll/ju6;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final E(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->getTopDecorationHeight(Landroid/view/View;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-ne v1, v0, :cond_1

    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->b:Z

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->c:F

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    sub-float/2addr v0, p1

    .line 48
    float-to-int p1, v0

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->a:I

    .line 50
    .line 51
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->b:Z

    .line 52
    .line 53
    :cond_0
    return v1

    .line 54
    :cond_1
    return v2
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->d:Ll/ju6;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    float-to-int v4, v1

    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    float-to-int v3, v1

    .line 24
    if-eqz v0, :cond_4

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    if-eq v0, v1, :cond_3

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    if-eq v0, v2, :cond_1

    .line 31
    .line 32
    const/4 v2, 0x3

    .line 33
    if-eq v0, v2, :cond_3

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->c:F

    .line 37
    .line 38
    int-to-float v2, v4

    .line 39
    sub-float/2addr v0, v2

    .line 40
    float-to-int v6, v0

    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->E(Landroid/view/MotionEvent;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->d:Ll/ju6;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->a:I

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr v6, v0

    .line 56
    const/4 v7, 0x1

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-interface/range {v2 .. v7}, Ll/ju6;->b(IIIIZ)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const/4 v5, 0x0

    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->E(Landroid/view/MotionEvent;)Z

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    invoke-interface/range {v2 .. v7}, Ll/ju6;->b(IIIIZ)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :goto_0
    if-eqz v0, :cond_5

    .line 73
    .line 74
    return v1

    .line 75
    :cond_3
    const/4 v0, 0x0

    .line 76
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->b:Z

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->d:Ll/ju6;

    .line 79
    .line 80
    invoke-interface {v0}, Ll/ju6;->a()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->d:Ll/ju6;

    .line 87
    .line 88
    invoke-interface {p0}, Ll/ju6;->c()V

    .line 89
    .line 90
    .line 91
    return v1

    .line 92
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->c:F

    .line 97
    .line 98
    :cond_5
    :goto_1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    return p0
.end method

.method public setCoordinatorListener(Ll/ju6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->d:Ll/ju6;

    .line 2
    .line 3
    return-void
.end method
