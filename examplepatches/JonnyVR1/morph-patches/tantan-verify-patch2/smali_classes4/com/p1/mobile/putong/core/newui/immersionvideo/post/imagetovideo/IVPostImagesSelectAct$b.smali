.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->k2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public d:Z

.field public e:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public final synthetic f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

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
    .locals 2
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/k$e;->A(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->d:Landroidx/recyclerview/widget/RecyclerView;

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
    if-eqz p2, :cond_1

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 19
    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-static {p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-static {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 43
    .line 44
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->e2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;)Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;

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
    .locals 3

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
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    const/4 v0, 0x1

    .line 18
    if-eq p2, p3, :cond_3

    .line 19
    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 21
    .line 22
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    if-ne p1, p3, :cond_0

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_0
    if-ge p1, p2, :cond_1

    .line 32
    .line 33
    move p3, p1

    .line 34
    :goto_0
    if-ge p3, p2, :cond_2

    .line 35
    .line 36
    add-int/lit8 v1, p3, 0x1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-ge v1, v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-static {v2, p3, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 53
    .line 54
    .line 55
    move p3, v1

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    move p3, p1

    .line 58
    :goto_1
    if-le p3, p2, :cond_2

    .line 59
    .line 60
    if-lez p3, :cond_2

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 65
    .line 66
    add-int/lit8 v2, p3, -0x1

    .line 67
    .line 68
    invoke-static {v1, p3, v2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 69
    .line 70
    .line 71
    add-int/lit8 p3, p3, -0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->d:Z

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$b;->f:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->e2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;)Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 83
    .line 84
    .line 85
    :cond_3
    :goto_2
    return v0
.end method
