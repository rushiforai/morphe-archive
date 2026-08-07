.class public Ll/rmg;
.super Ll/elh;
.source "SourceFile"

# interfaces
.implements Ll/jn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/elh<",
        "Ll/qmg;",
        ">;",
        "Ll/jn50;"
    }
.end annotation


# instance fields
.field public o:Landroid/widget/LinearLayout;

.field public p:Landroid/widget/FrameLayout;

.field public q:Lv/VPullDownRefreshLayout;

.field public r:Lv/VRecyclerView;

.field public s:Lv/VLinear;

.field public t:Lv/VDraweeView;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/android/app/Act;

.field public x:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

.field public y:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/elh;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rmg$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/rmg$a;-><init>(Ll/rmg;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rmg;->y:Ll/h80;

    .line 10
    .line 11
    iput-object p1, p0, Ll/rmg;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/rmg;->w:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic J(Ll/rmg;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/rmg;->N(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private N(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const-string v1, "moment_id"

    .line 12
    .line 13
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    const-string v1, "owner_id"

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 37
    .line 38
    iget-object p0, p0, Ll/umh;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v1, "moment_showfrom"

    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "moment_type"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_1

    .line 75
    .line 76
    const-string p0, "reply"

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    const-string p0, "comment"

    .line 80
    .line 81
    :goto_0
    const-string p1, "comment_detail"

    .line 82
    .line 83
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_1
    return-object v0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rmg;->w:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/smg;->b(Ll/rmg;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tmg;->b(Ll/rmg;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M(Ll/qmg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    invoke-super {p0, p1}, Ll/elh;->l(Ll/umh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rmg;->w:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qmg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rmg;->M(Ll/qmg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rmg;->L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/rmg;->r:Lv/VRecyclerView;

    .line 6
    .line 7
    iput-object v0, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 8
    .line 9
    iget-object v0, p0, Ll/rmg;->s:Lv/VLinear;

    .line 10
    .line 11
    iput-object v0, p0, Ll/elh;->f:Lv/VLinear;

    .line 12
    .line 13
    iget-object v0, p0, Ll/rmg;->t:Lv/VDraweeView;

    .line 14
    .line 15
    iput-object v0, p0, Ll/elh;->g:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v0, p0, Ll/rmg;->u:Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Ll/elh;->h:Lv/VText;

    .line 20
    .line 21
    iget-object v0, p0, Ll/rmg;->v:Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Ll/elh;->i:Lv/VText;

    .line 24
    .line 25
    iget-object v0, p0, Ll/rmg;->q:Lv/VPullDownRefreshLayout;

    .line 26
    .line 27
    iput-object v0, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/rmg;->r:Lv/VRecyclerView;

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/rmg;->r:Lv/VRecyclerView;

    .line 39
    .line 40
    invoke-virtual {p0, p1, v0}, Ll/rmg;->K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/b370;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/rmg;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/rmg;->o:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    iget-object v2, p0, Ll/elh;->a:Ll/umh;

    .line 52
    .line 53
    iget-object v3, p0, Ll/rmg;->y:Ll/h80;

    .line 54
    .line 55
    invoke-direct {p1, v0, v1, v2, v3}, Ll/b370;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ll/omg;Ll/h80;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/elh;->k:Ll/b370;

    .line 59
    .line 60
    new-instance v0, Ll/s8h;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/elh;->e:Ll/s8h;

    .line 66
    .line 67
    iget-object p1, p0, Ll/rmg;->p:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    iput-object p1, p0, Ll/elh;->m:Landroid/widget/FrameLayout;

    .line 70
    .line 71
    iget-object p0, p0, Ll/rmg;->r:Lv/VRecyclerView;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 74
    .line 75
    .line 76
    return-object p2
.end method

.method public bridge synthetic l(Ll/umh;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qmg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rmg;->M(Ll/qmg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    iget p0, p0, Ll/umh;->b:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 9
    .line 10
    iget-object p0, p0, Ll/jka;->W0:Lrx/subjects/b;

    .line 11
    .line 12
    new-instance v0, Ll/bkj0;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct {v0, v3, v1, v2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/elh;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    iget p0, p0, Ll/umh;->b:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 9
    .line 10
    iget-object p0, p0, Ll/jka;->W0:Lrx/subjects/b;

    .line 11
    .line 12
    new-instance v0, Ll/bkj0;

    .line 13
    .line 14
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-direct {v0, p1, p2, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
