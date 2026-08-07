.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Z

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->c:Z

    .line 8
    .line 9
    new-instance p1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->d:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->L(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->K(Ll/pf60;)V

    return-void
.end method

.method private synthetic L(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->c:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Moment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

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
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/tec0;->r5:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    if-nez p2, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    new-instance p1, Landroid/widget/TextView;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    return-object p1
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Moment;II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->A:Lv/VRecyclerView;

    .line 9
    .line 10
    invoke-virtual {p1, p2, p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;->f(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VRecyclerView;I)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lt p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    return-object p0
.end method

.method public I(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->getItemViewType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->i(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final J(Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    instance-of p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic K(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

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
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 22
    .line 23
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/util/Collection;

    .line 26
    .line 27
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->c:Z

    .line 37
    .line 38
    return-void
.end method

.method public M()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 13
    .line 14
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->c5(Lcom/p1/mobile/putong/data/Links;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v3, Ll/hdc0;->w1:I

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v2, Ll/hdc0;->T1:I

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget v3, Ll/hdc0;->w1:I

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget v1, Ll/hdc0;->T1:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->d:Ljava/util/Map;

    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public e(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->c5(Lcom/p1/mobile/putong/data/Links;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr v0, p1

    .line 30
    const/16 p1, 0xa

    .line 31
    .line 32
    if-gt v0, p1, :cond_0

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->c:Z

    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/jka;->ec(Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/wb70;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/wb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/xb70;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/xb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->H(I)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->c5(Lcom/p1/mobile/putong/data/Links;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x2

    .line 20
    return p0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-ne p1, p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 7

    .line 1
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->getItemViewType(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_4

    .line 7
    .line 8
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_4

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->d:Ljava/util/Map;

    .line 29
    .line 30
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->d:Ljava/util/Map;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    div-int/lit8 v2, v2, 0x2

    .line 64
    .line 65
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 74
    .line 75
    const/4 v4, 0x0

    .line 76
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 81
    .line 82
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    if-eqz v3, :cond_1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const/4 v3, 0x0

    .line 90
    :goto_0
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    if-eqz v4, :cond_3

    .line 95
    .line 96
    new-instance v4, Landroid/graphics/Point;

    .line 97
    .line 98
    invoke-direct {v4}, Landroid/graphics/Point;-><init>()V

    .line 99
    .line 100
    .line 101
    iput v2, v4, Landroid/graphics/Point;->x:I

    .line 102
    .line 103
    int-to-float v5, v2

    .line 104
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 105
    .line 106
    iget v6, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 107
    .line 108
    int-to-float v6, v6

    .line 109
    div-float/2addr v5, v6

    .line 110
    iget v3, v3, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 111
    .line 112
    int-to-float v3, v3

    .line 113
    mul-float/2addr v5, v3

    .line 114
    float-to-int v3, v5

    .line 115
    iput v3, v4, Landroid/graphics/Point;->y:I

    .line 116
    .line 117
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 118
    .line 119
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_2
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 123
    .line 124
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 125
    .line 126
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->d:Ljava/util/Map;

    .line 127
    .line 128
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 129
    .line 130
    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 131
    .line 132
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    :goto_2
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 142
    .line 143
    .line 144
    :cond_4
    invoke-super {p0, p1, p2}, Ll/jic0;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :catch_0
    move-exception p0

    .line 149
    new-instance p1, Ljava/lang/Exception;

    .line 150
    .line 151
    new-instance p2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v0, "PhotoAlbumFallFeedFrag unknownException:"

    .line 154
    .line 155
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->J(Landroidx/recyclerview/widget/RecyclerView$e0;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getLayoutPosition()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag$a;->I(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
