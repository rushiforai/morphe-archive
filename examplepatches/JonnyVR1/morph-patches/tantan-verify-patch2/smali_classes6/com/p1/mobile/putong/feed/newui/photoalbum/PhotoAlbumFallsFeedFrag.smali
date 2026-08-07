.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;,
        Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;
    }
.end annotation


# static fields
.field public static G:I

.field public static H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public static I:Lcom/p1/mobile/putong/data/Links;


# instance fields
.field public A:Lv/VRecyclerView;

.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

.field public C:Landroid/view/View;

.field public D:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;

.field public E:Z

.field public F:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;

.field public z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/k4h;->a:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->G:I

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->E:Z

    .line 6
    .line 7
    new-instance v0, Ll/jb70;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/jb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/nb70;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/nb70;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/ob70;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ob70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/pb70;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/pb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/qb70;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/qb70;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/rb70;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/rb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/sb70;

    .line 63
    .line 64
    invoke-direct {v0}, Ll/sb70;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/tb70;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/tb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->f5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N4()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object v0
.end method

.method public static synthetic O4()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->l0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object v0
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->j5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->i5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->d5(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->h5(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic T4()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->gc()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->g5(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->e5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->k5()V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->l5(I)V

    return-void
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->C:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->n5()V

    return-void
.end method

.method private synthetic d5(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    new-instance p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->A:Lv/VRecyclerView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;

    .line 18
    .line 19
    const/4 v0, 0x5

    .line 20
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;I)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$b;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->A:Lv/VRecyclerView;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->A:Lv/VRecyclerView;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 48
    .line 49
    sget p1, Ll/k9c0;->k0:I

    .line 50
    .line 51
    sget v0, Ll/k9c0;->h0:I

    .line 52
    .line 53
    sget v1, Ll/k9c0;->i0:I

    .line 54
    .line 55
    sget v2, Ll/k9c0;->j0:I

    .line 56
    .line 57
    filled-new-array {p1, v0, v1, v2}, [I

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    sput-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 66
    .line 67
    return-void
.end method

.method private synthetic e5(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 19
    .line 20
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/util/Collection;

    .line 23
    .line 24
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->n5()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic f5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic i5(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 19
    .line 20
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/util/Collection;

    .line 23
    .line 24
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->n5()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic j5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/yb70;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c5(Lcom/p1/mobile/putong/data/Links;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic g5(Ljava/util/Map;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    invoke-interface {v3, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->n5()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic h5(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/mb70;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/mb70;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->n5()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->b5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Ll/k9c0;->p0:I

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    sget v0, Ll/tec0;->z:I

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {p2, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->C:Landroid/view/View;

    .line 35
    .line 36
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 39
    .line 40
    .line 41
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;

    .line 42
    .line 43
    return-object p1
.end method

.method public final synthetic k5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->A:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic l5(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->A:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->z:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->p()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/kb70;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/kb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final n5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->M()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->c5(Lcom/p1/mobile/putong/data/Links;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 30
    .line 31
    const/16 v0, 0x8

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public o5(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    move v0, v1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    :goto_1
    new-instance p1, Ll/lb70;

    .line 33
    .line 34
    invoke-direct {p1, p0, v0}, Ll/lb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;I)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->gc()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ub70;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/ub70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/vb70;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/vb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public p5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->E:Z

    .line 2
    .line 3
    return-void
.end method
