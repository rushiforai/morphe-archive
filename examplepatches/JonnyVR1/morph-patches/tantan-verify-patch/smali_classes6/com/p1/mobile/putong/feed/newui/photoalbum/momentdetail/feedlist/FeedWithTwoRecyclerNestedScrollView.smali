.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;
.super Landroidx/core/widget/NestedScrollView;
.source "SourceFile"


# instance fields
.field public F:I

.field public G:I

.field public H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public J:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->F:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->G:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->J:Z

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->F:I

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->G:I

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->J:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->F:I

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->G:I

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->J:Z

    return-void
.end method


# virtual methods
.method public T(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_5

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    if-eqz v2, :cond_4

    .line 24
    .line 25
    const-string v2, "FIRST_RECYCLER_TAG"

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 40
    .line 41
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->J:Z

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    const v2, 0x7fffffff

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->G:I

    .line 50
    .line 51
    :goto_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;->setMaxHeight(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    const-string v2, "SECOND_RECYCLER_TAG"

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 70
    .line 71
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->G:I

    .line 72
    .line 73
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    check-cast v1, Landroid/view/ViewGroup;

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->T(Landroid/view/ViewGroup;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    :goto_3
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/core/widget/NestedScrollView;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->G:I

    .line 9
    .line 10
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/core/widget/NestedScrollView;->onNestedFling(Landroid/view/View;FFZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/core/widget/NestedScrollView;->onNestedPreFling(Landroid/view/View;FF)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onNestedPreScroll(Landroid/view/View;II[II)V
    .locals 5
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->T(Landroid/view/ViewGroup;)V

    .line 10
    .line 11
    .line 12
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 13
    .line 14
    if-eqz v0, :cond_d

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 17
    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    goto/16 :goto_7

    .line 21
    .line 22
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->F:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    const/4 v2, 0x1

    .line 32
    if-ne p1, v0, :cond_7

    .line 33
    .line 34
    if-lez p3, :cond_3

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->canScrollVertically(I)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->F:I

    .line 47
    .line 48
    if-ge v0, v3, :cond_3

    .line 49
    .line 50
    move v0, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_3
    move v0, v1

    .line 53
    :goto_0
    if-gez p3, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-lez v3, :cond_4

    .line 60
    .line 61
    move v3, v2

    .line 62
    goto :goto_1

    .line 63
    :cond_4
    move v3, v1

    .line 64
    :goto_1
    if-nez v0, :cond_6

    .line 65
    .line 66
    if-eqz v3, :cond_5

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_5
    if-lez p3, :cond_c

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/view/View;->canScrollVertically(I)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 80
    .line 81
    invoke-virtual {v0, v1, p3}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 82
    .line 83
    .line 84
    aput p3, p4, v2

    .line 85
    .line 86
    goto :goto_6

    .line 87
    :cond_6
    :goto_2
    invoke-virtual {p0, v1, p3}, Landroid/view/View;->scrollBy(II)V

    .line 88
    .line 89
    .line 90
    aput p3, p4, v2

    .line 91
    .line 92
    goto :goto_6

    .line 93
    :cond_7
    if-lez p3, :cond_8

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->F:I

    .line 100
    .line 101
    if-ge v0, v3, :cond_8

    .line 102
    .line 103
    move v0, v2

    .line 104
    goto :goto_3

    .line 105
    :cond_8
    move v0, v1

    .line 106
    :goto_3
    const/4 v3, -0x1

    .line 107
    if-gez p3, :cond_9

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    if-lez v4, :cond_9

    .line 114
    .line 115
    invoke-virtual {p1, v3}, Landroid/view/View;->canScrollVertically(I)Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    if-nez v4, :cond_9

    .line 120
    .line 121
    move v4, v2

    .line 122
    goto :goto_4

    .line 123
    :cond_9
    move v4, v1

    .line 124
    :goto_4
    if-nez v0, :cond_b

    .line 125
    .line 126
    if-eqz v4, :cond_a

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_a
    if-gez p3, :cond_c

    .line 130
    .line 131
    invoke-virtual {p1, v3}, Landroid/view/View;->canScrollVertically(I)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_c

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 138
    .line 139
    invoke-virtual {v0, v1, p3}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 140
    .line 141
    .line 142
    aput p3, p4, v2

    .line 143
    .line 144
    goto :goto_6

    .line 145
    :cond_b
    :goto_5
    invoke-virtual {p0, v1, p3}, Landroid/view/View;->scrollBy(II)V

    .line 146
    .line 147
    .line 148
    aput p3, p4, v2

    .line 149
    .line 150
    :cond_c
    :goto_6
    invoke-super/range {p0 .. p5}, Landroidx/core/widget/NestedScrollView;->onNestedPreScroll(Landroid/view/View;II[II)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_d
    :goto_7
    invoke-super/range {p0 .. p5}, Landroidx/core/widget/NestedScrollView;->onNestedPreScroll(Landroid/view/View;II[II)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIIII[I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super/range {p0 .. p7}, Landroidx/core/widget/NestedScrollView;->onNestedScroll(Landroid/view/View;IIIII[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setFirstRecyclerUserIntegerMaxHeight(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->J:Z

    .line 2
    .line 3
    return-void
.end method
