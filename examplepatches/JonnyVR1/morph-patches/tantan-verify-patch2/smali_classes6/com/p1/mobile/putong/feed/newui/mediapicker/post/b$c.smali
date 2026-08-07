.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->b0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public d:Z

.field public e:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public final synthetic f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/k$e;->A(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 28
    .line 29
    invoke-static {p1, p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Y(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-static {p1, p2, v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Y(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 43
    .line 44
    :goto_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->d:Z

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->o1(Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$e0;->getItemViewType()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/xl80;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p1, 0xf

    .line 15
    .line 16
    invoke-static {p1, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eq p2, v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-ne p1, v0, :cond_0

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_0
    if-ge p1, p2, :cond_1

    .line 34
    .line 35
    move v0, p1

    .line 36
    :goto_0
    if-ge v0, p2, :cond_2

    .line 37
    .line 38
    add-int/lit8 v2, v0, 0x1

    .line 39
    .line 40
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-ge v2, v3, :cond_2

    .line 45
    .line 46
    invoke-static {p3, v0, v2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 47
    .line 48
    .line 49
    move v0, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v0, p1

    .line 52
    :goto_1
    if-le v0, p2, :cond_2

    .line 53
    .line 54
    if-lez v0, :cond_2

    .line 55
    .line 56
    add-int/lit8 v2, v0, -0x1

    .line 57
    .line 58
    invoke-static {p3, v0, v2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, -0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->d:Z

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 69
    .line 70
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setSelectedImages(Ljava/util/ArrayList;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 74
    .line 75
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/xl80;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_2
    return v1
.end method
