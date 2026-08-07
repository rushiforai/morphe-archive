.class public Ll/b370;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Landroid/view/View;

.field public f:Ll/omg;

.field public g:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ll/omg;Ll/h80;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/b370;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/b370;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/b370;->e:Landroid/view/View;

    .line 14
    .line 15
    iput-object p3, p0, Ll/b370;->f:Ll/omg;

    .line 16
    .line 17
    iput-object p4, p0, Ll/b370;->g:Ll/h80;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/b370;->E(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentActivity;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b370;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/b370;->e:Landroid/view/View;

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object v0, p0, Ll/b370;->d:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/tec0;->o5:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    .line 21
    .line 22
    iget-object p0, p0, Ll/b370;->f:Ll/omg;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/omg;->T0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->P(I)V

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentActivity;II)V
    .locals 8

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x6

    .line 3
    if-le p3, v0, :cond_0

    .line 4
    .line 5
    if-eq p3, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x7

    .line 8
    if-ne p3, v0, :cond_2

    .line 9
    .line 10
    :cond_0
    move-object v2, p1

    .line 11
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    .line 12
    .line 13
    if-ne p3, v1, :cond_1

    .line 14
    .line 15
    const/4 p3, 0x1

    .line 16
    :cond_1
    move v5, p3

    .line 17
    iget-object v6, p0, Ll/b370;->f:Ll/omg;

    .line 18
    .line 19
    move-object v3, p0

    .line 20
    move-object v4, p2

    .line 21
    move v7, p4

    .line 22
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->F0(Ll/b370;Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, v3, Ll/b370;->g:Ll/h80;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    iget-object p0, v3, Ll/b370;->g:Ll/h80;

    .line 34
    .line 35
    invoke-virtual {p0, p1, v4, v7}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/feed/data/MomentActivity;
    .locals 2

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b370;->C()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/b370;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 18
    .line 19
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/b370;->c:Ljava/util/List;

    .line 2
    .line 3
    iget-object p1, p0, Ll/b370;->f:Ll/omg;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/omg;->d0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/b370;->f:Ll/omg;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/omg;->L3()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b370;->f:Ll/omg;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/omg;->e(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b370;->F(I)Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/b370;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x5

    .line 10
    return p0

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v0, v0, Ll/jka;->i0:Ljava/util/Map;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/b370;->F(I)Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    if-eqz p0, :cond_4

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    const/4 p0, 0x6

    .line 54
    return p0

    .line 55
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-lez v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    const/4 p0, 0x7

    .line 74
    return p0

    .line 75
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    const/4 p1, 0x4

    .line 82
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0

    .line 87
    :cond_4
    :goto_0
    return p1
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b370;->g:Ll/h80;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/b370;->g:Ll/h80;

    .line 13
    .line 14
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/h80;->g(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b370;->g:Ll/h80;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/b370;->g:Ll/h80;

    .line 13
    .line 14
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/h80;->i(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
