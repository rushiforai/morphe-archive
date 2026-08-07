.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;,
        Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;
    }
.end annotation


# static fields
.field public static F0:Ljava/lang/String; = ""

.field public static G0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/FeedSelectParams;",
            ">;"
        }
    .end annotation
.end field

.field public static H0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static I0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static J0:Z

.field public static K0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

.field public B:Lv/VFrame;

.field public C:Lv/navigationbar/VNavigationBar;

.field public D:Z

.field public E:Z

.field public E0:Z

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public J:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public L:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;",
            ">;"
        }
    .end annotation
.end field

.field public M:I

.field public N:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;"
        }
    .end annotation
.end field

.field public O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

.field public P:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public Q:Lv/navigationbar/VNavigationTabLayout;

.field public R:[Landroid/widget/TextView;

.field public S:[Landroid/widget/ImageView;

.field public T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public U:I

.field public V:Lv/VImage;

.field public W:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/f60;",
            ">;"
        }
    .end annotation
.end field

.field public X:Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

.field public Y:Z

.field public Z:Z

.field public k0:Z

.field public p0:Landroid/widget/PopupWindow;

.field public z:Landroid/widget/RelativeLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I0:Lrx/subjects/b;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    sput-boolean v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J0:Z

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K0:Lrx/subjects/b;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->L:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->M:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 23
    .line 24
    const/4 v0, 0x4

    .line 25
    new-array v1, v0, [Landroid/widget/TextView;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->R:[Landroid/widget/TextView;

    .line 28
    .line 29
    new-array v1, v0, [Landroid/widget/ImageView;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 32
    .line 33
    new-array v0, v0, [Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 39
    .line 40
    new-instance v1, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->W:Ljava/util/ArrayList;

    .line 46
    .line 47
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Y:Z

    .line 48
    .line 49
    return-void
.end method

.method private C5()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method private synthetic E4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->k0:Z

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->k0:Z

    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method private E5()I
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x11

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    const/16 p0, 0xf

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    invoke-static {}, Ll/pu20;->p()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->x5()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/16 p0, 0x10

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    return v1
.end method

.method private F5()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "p_discover_dating"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method private H5()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->p5()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->U4()Ll/hf70;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/hf70;->j0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q5(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic M5(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->d()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget p1, Ll/hdc0;->W1:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->q0()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->setScrollTv(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->r0()V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->R5(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic N5(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->p1:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 21
    .line 22
    if-eq v1, v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->f6()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    sput-boolean v0, Ll/kbh;->i:Z

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T5()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Y:Z

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->M5(Ll/uxj0;)V

    return-void
.end method

.method private synthetic O5(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G0:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/cmg;->D()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/cmg;->D()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const-string p1, "e_select_icon"

    .line 23
    .line 24
    const-string v0, "p_discover_dating"

    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->a6(Lv/VImage;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N5(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic P5(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ne p1, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sput-boolean v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J0:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->f6()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 24
    .line 25
    if-ne p1, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 38
    .line 39
    sput-boolean v1, Ll/kbh;->i:Z

    .line 40
    .line 41
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/t8c;->h()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/16 p1, 0xf

    .line 53
    .line 54
    const-string v0, "p_discover_dating"

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0}, Ll/byh;->m(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string p0, "sort_type"

    .line 60
    .line 61
    const-string p1, "like"

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    filled-new-array {p0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "e_second_tab"

    .line 72
    .line 73
    const-string v0, "p_follow"

    .line 74
    .line 75
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K5(I)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->L5(I)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O5(Landroid/view/View;)V

    return-void
.end method

.method private S5(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 11
    .line 12
    aget-object p1, v0, p1

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/cmg;->K()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic V4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    return-object p0
.end method

.method private V5(I)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->g6(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 11
    .line 12
    aget-object p1, v1, p1

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/cmg;->K()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public static bridge synthetic W4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    return-object p0
.end method

.method public static bridge synthetic X4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    return p0
.end method

.method public static bridge synthetic Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    return p0
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    return-object p0
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X:Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    return-object p0
.end method

.method public static bridge synthetic b5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->R:[Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic d5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic e5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    return-void
.end method

.method public static bridge synthetic f5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    return-void
.end method

.method public static bridge synthetic g5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N:Ljava/util/List;

    return-void
.end method

.method public static bridge synthetic h5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->z5()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic i5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C5()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic j5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->D5(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic k5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->g6(Z)V

    return-void
.end method

.method public static bridge synthetic l5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->h6(I)V

    return-void
.end method

.method public static n5()Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private p5()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x0

    .line 28
    const-string v2, "from_nearby_focus"

    .line 29
    .line 30
    const/4 v3, -0x1

    .line 31
    const-string v4, "-1"

    .line 32
    .line 33
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->N4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const/16 v5, 0xc

    .line 48
    .line 49
    const-string v2, "from_like"

    .line 50
    .line 51
    const-string v4, "-1"

    .line 52
    .line 53
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->N4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "-1"

    .line 68
    .line 69
    const/16 v2, 0xe

    .line 70
    .line 71
    const-string v3, "from_discover_dating"

    .line 72
    .line 73
    const/4 v4, -0x1

    .line 74
    invoke-static {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 79
    .line 80
    return-void
.end method

.method private t5(Landroid/view/View;ZZILjava/lang/String;)V
    .locals 0

    .line 1
    xor-int p0, p2, p3

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/byh;->s(Ljava/lang/Integer;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p0, p2, p1, p4, p5}, Ll/byh;->p(ZLandroid/view/View;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method private z5()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method


# virtual methods
.method public A5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public B5()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Q4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final D5(I)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 v0, 0x1

    .line 6
    if-ne p1, v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    const/4 p0, 0x5

    .line 16
    return p0

    .line 17
    :cond_2
    return v0
.end method

.method public G5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->V4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I5()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 4
    .line 5
    invoke-virtual {v2}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_3

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->l(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 18
    .line 19
    invoke-virtual {v3, v1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3, v2}, Lv/navigationbar/VNavigationTabLayout$f;->n(Landroid/view/View;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 30
    .line 31
    invoke-virtual {v3, v1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    iget-object v3, v3, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 39
    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    const/high16 v4, 0x40800000    # 4.0f

    .line 43
    .line 44
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    move v4, v0

    .line 50
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 51
    .line 52
    invoke-virtual {v5, v1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-object v5, v5, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 60
    .line 61
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 66
    .line 67
    invoke-virtual {v6, v1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget-object v6, v6, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 75
    .line 76
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    invoke-virtual {v3, v4, v5, v0, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 81
    .line 82
    .line 83
    sget v3, Ll/hdc0;->W1:I

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->getTitleView()Lv/VText;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const/4 v3, 0x1

    .line 96
    if-ne v1, v3, :cond_1

    .line 97
    .line 98
    sget v4, Ll/fgc0;->q:I

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_1
    sget v4, Ll/fgc0;->r:I

    .line 102
    .line 103
    :goto_2
    invoke-static {v2, v4}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 104
    .line 105
    .line 106
    if-ne v1, v3, :cond_2

    .line 107
    .line 108
    sget v3, Ll/lbc0;->X0:I

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_2
    sget v3, Ll/lbc0;->W0:I

    .line 112
    .line 113
    :goto_3
    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 114
    .line 115
    .line 116
    add-int/lit8 v1, v1, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    return-void
.end method

.method public J5()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->U4()Ll/hf70;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/hf70;->j0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic K5(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V5(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L5(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S5(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->P0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic Q5(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->F0:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T5()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic R5(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->R:[Landroid/widget/TextView;

    .line 21
    .line 22
    aget-object v0, v0, v1

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/4 v0, 0x0

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v4, 0x0

    .line 49
    const/4 v5, 0x0

    .line 50
    const-string v1, "from_nearby_focus"

    .line 51
    .line 52
    const/4 v2, -0x1

    .line 53
    const-string v3, "-1"

    .line 54
    .line 55
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->N4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/16 v4, 0xc

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    const-string v1, "from_like"

    .line 76
    .line 77
    const/4 v2, -0x1

    .line 78
    const-string v3, "-1"

    .line 79
    .line 80
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->N4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 85
    .line 86
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X5(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 94
    .line 95
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 96
    .line 97
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ll/t8c;->a(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public T5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public U5(Z)V
    .locals 6

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_3

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    :goto_0
    if-ge v1, p1, :cond_3

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const/4 v4, -0x2

    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v5, "page_type"

    .line 42
    .line 43
    invoke-virtual {v3, v5, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    :goto_1
    if-eqz v4, :cond_1

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    move v3, v0

    .line 52
    :goto_2
    instance-of v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 53
    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 61
    .line 62
    .line 63
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    return-void

    .line 67
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public W5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Z4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final X5(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->N:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z5()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->e6()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->o(ILcom/p1/mobile/putong/app/PutongFrag;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->c5()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I5()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->D5(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->h6(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public Y5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->a5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->b5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final a6(Lv/VImage;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->p0:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->p0:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/cmg;->D()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance v1, Ll/e0h;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    sget-object v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G0:Ljava/util/List;

    .line 30
    .line 31
    sget-object v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->F0:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v6, Ll/sbj;

    .line 34
    .line 35
    invoke-direct {v6, p0}, Ll/sbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 36
    .line 37
    .line 38
    move-object v2, p1

    .line 39
    invoke-direct/range {v1 .. v6}, Ll/e0h;-><init>(Lv/VImage;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->p0:Landroid/widget/PopupWindow;

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_1
    move-object v2, p1

    .line 46
    invoke-static {}, Ll/cmg;->K()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    const-string p1, "e_type_popup"

    .line 53
    .line 54
    const-string v0, "p_like"

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance v7, Ll/b5h;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    sget-object v10, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H0:Ljava/util/List;

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/4 v0, 0x1

    .line 74
    if-le p1, v0, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ljava/lang/String;

    .line 83
    .line 84
    :goto_0
    move-object v11, p1

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    const-string p1, ""

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :goto_1
    new-instance v12, Ll/tbj;

    .line 90
    .line 91
    invoke-direct {v12, p0}, Ll/tbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 92
    .line 93
    .line 94
    move-object v8, v2

    .line 95
    invoke-direct/range {v7 .. v12}, Ll/b5h;-><init>(Lv/VImage;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ll/y20;)V

    .line 96
    .line 97
    .line 98
    iput-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->p0:Landroid/widget/PopupWindow;

    .line 99
    .line 100
    :cond_3
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->p0:Landroid/widget/PopupWindow;

    .line 101
    .line 102
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 107
    .line 108
    const/high16 v0, 0x41400000    # 12.0f

    .line 109
    .line 110
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    sub-int/2addr p1, v1

    .line 115
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    neg-int v0, v0

    .line 120
    invoke-virtual {p0, v2, p1, v0}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public b6(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->D:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->j(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->j(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 35
    .line 36
    instance-of v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->e5(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method public c6(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d6(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->F:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e6()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->m5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f4()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->K()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/nbj;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/nbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-static {}, Ll/cmg;->K()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I0:Lrx/subjects/b;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/obj;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/obj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-static {}, Ll/cmg;->K()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->p1:Lrx/subjects/a;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/pbj;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/pbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public final f6()V
    .locals 7

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E0:Z

    .line 18
    .line 19
    sput-boolean v1, Ll/kbh;->i:Z

    .line 20
    .line 21
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/t8c;->h()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/byh;->d()Ll/byh;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/16 v2, 0xf

    .line 33
    .line 34
    const-string v3, "p_discover_dating"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v3}, Ll/byh;->m(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v0, "sort_type"

    .line 40
    .line 41
    const-string v2, "like"

    .line 42
    .line 43
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {v0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "e_second_tab"

    .line 52
    .line 53
    const-string v3, "p_follow"

    .line 54
    .line 55
    invoke-static {v2, v3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-le v0, v1, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->R:[Landroid/widget/TextView;

    .line 81
    .line 82
    aget-object v0, v0, v1

    .line 83
    .line 84
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    const/4 v0, 0x0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const/16 v5, 0xc

    .line 103
    .line 104
    const/4 v6, 0x0

    .line 105
    const-string v2, "from_like"

    .line 106
    .line 107
    const/4 v3, -0x1

    .line 108
    const-string v4, "-1"

    .line 109
    .line 110
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->N4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X5(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {}, Ll/pu20;->p()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-interface {p1, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/cmg;->K()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {v0, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {v0, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H5()V

    .line 39
    .line 40
    .line 41
    new-instance p1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 47
    .line 48
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/cmg;->K()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 58
    .line 59
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 64
    .line 65
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->n(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    sget v3, Ll/k9c0;->n0:I

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setupViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 119
    .line 120
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTabLayout()Lv/navigationbar/VNavigationTabLayout;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->z:Landroid/widget/RelativeLayout;

    .line 127
    .line 128
    const/high16 v0, 0x42300000    # 44.0f

    .line 129
    .line 130
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-static {}, Ll/bnl0;->F0()I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    add-int/2addr v0, v3

    .line 139
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 140
    .line 141
    .line 142
    invoke-static {}, Ll/cmg;->D()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_2

    .line 147
    .line 148
    invoke-static {}, Ll/cmg;->K()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_5

    .line 153
    .line 154
    :cond_2
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    const-string v0, "feed_filter_params_configs"

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-nez v0, :cond_3

    .line 169
    .line 170
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 171
    .line 172
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/dbcenter/parse/JsonParseHelper;->parseList(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G0:Ljava/util/List;
    :try_end_0
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :catch_0
    move-exception p1

    .line 180
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 181
    .line 182
    .line 183
    :cond_3
    :goto_2
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G0:Ljava/util/List;

    .line 184
    .line 185
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-nez p1, :cond_4

    .line 190
    .line 191
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G0:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    sub-int/2addr v0, v2

    .line 198
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 203
    .line 204
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->param:Ljava/lang/String;

    .line 205
    .line 206
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->F0:Ljava/lang/String;

    .line 207
    .line 208
    :cond_4
    new-instance p1, Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .line 212
    .line 213
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H0:Ljava/util/List;

    .line 214
    .line 215
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H0:Ljava/util/List;

    .line 223
    .line 224
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    new-instance p1, Lv/VImage;

    .line 232
    .line 233
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-direct {p1, v0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 238
    .line 239
    .line 240
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 241
    .line 242
    invoke-static {}, Ll/cmg;->K()Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    xor-int/2addr v0, v2

    .line 247
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 251
    .line 252
    const/high16 v0, 0x40c00000    # 6.0f

    .line 253
    .line 254
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 259
    .line 260
    .line 261
    move-result v4

    .line 262
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    invoke-virtual {p1, v3, v4, v5, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 271
    .line 272
    .line 273
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 278
    .line 279
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mm(Lv/VImage;Z)V

    .line 280
    .line 281
    .line 282
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 283
    .line 284
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 285
    .line 286
    new-array v3, v2, [Landroid/view/View;

    .line 287
    .line 288
    aput-object v0, v3, v1

    .line 289
    .line 290
    invoke-virtual {p1, v3}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 291
    .line 292
    .line 293
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 294
    .line 295
    new-instance v0, Ll/qbj;

    .line 296
    .line 297
    invoke-direct {v0, p0}, Ll/qbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 298
    .line 299
    .line 300
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 301
    .line 302
    .line 303
    :cond_5
    invoke-static {}, Ll/cmg;->J()Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    if-eqz p1, :cond_7

    .line 308
    .line 309
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 310
    .line 311
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;-><init>(Landroid/content/Context;)V

    .line 316
    .line 317
    .line 318
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X:Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 319
    .line 320
    invoke-static {}, Ll/nyh;->a()Ll/nyh;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X:Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 325
    .line 326
    invoke-virtual {p1, v0}, Ll/nyh;->d(Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 330
    .line 331
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C:Lv/navigationbar/VNavigationBar;

    .line 336
    .line 337
    if-eqz p1, :cond_6

    .line 338
    .line 339
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X:Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 340
    .line 341
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V:Lv/VImage;

    .line 342
    .line 343
    const/4 v4, 0x2

    .line 344
    new-array v4, v4, [Landroid/view/View;

    .line 345
    .line 346
    aput-object p1, v4, v1

    .line 347
    .line 348
    aput-object v3, v4, v2

    .line 349
    .line 350
    invoke-virtual {v0, v4}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 351
    .line 352
    .line 353
    goto :goto_3

    .line 354
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X:Lcom/p1/mobile/putong/feed/newui/view/RoamEntranceView;

    .line 355
    .line 356
    new-array v3, v2, [Landroid/view/View;

    .line 357
    .line 358
    aput-object p1, v3, v1

    .line 359
    .line 360
    invoke-virtual {v0, v3}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 361
    .line 362
    .line 363
    :cond_7
    :goto_3
    move p1, v1

    .line 364
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 365
    .line 366
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-ge p1, v0, :cond_b

    .line 371
    .line 372
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 373
    .line 374
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->l(I)Landroid/view/View;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 379
    .line 380
    invoke-virtual {v3, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 381
    .line 382
    .line 383
    move-result-object v3

    .line 384
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v3, v0}, Lv/navigationbar/VNavigationTabLayout$f;->n(Landroid/view/View;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 388
    .line 389
    .line 390
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 391
    .line 392
    invoke-virtual {v3, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    iget-object v3, v3, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 400
    .line 401
    if-nez p1, :cond_8

    .line 402
    .line 403
    const/high16 v4, 0x40800000    # 4.0f

    .line 404
    .line 405
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 406
    .line 407
    .line 408
    move-result v4

    .line 409
    goto :goto_5

    .line 410
    :cond_8
    move v4, v1

    .line 411
    :goto_5
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 412
    .line 413
    invoke-virtual {v5, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 414
    .line 415
    .line 416
    move-result-object v5

    .line 417
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    iget-object v5, v5, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 421
    .line 422
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 423
    .line 424
    .line 425
    move-result v5

    .line 426
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 427
    .line 428
    invoke-virtual {v6, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 429
    .line 430
    .line 431
    move-result-object v6

    .line 432
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    .line 434
    .line 435
    iget-object v6, v6, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 436
    .line 437
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    .line 438
    .line 439
    .line 440
    move-result v6

    .line 441
    invoke-virtual {v3, v4, v5, v1, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 442
    .line 443
    .line 444
    sget v3, Ll/hdc0;->W1:I

    .line 445
    .line 446
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 451
    .line 452
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->getTitleView()Lv/VText;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    if-nez p1, :cond_9

    .line 457
    .line 458
    sget v3, Ll/fgc0;->q:I

    .line 459
    .line 460
    goto :goto_6

    .line 461
    :cond_9
    sget v3, Ll/fgc0;->r:I

    .line 462
    .line 463
    :goto_6
    invoke-static {v0, v3}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 464
    .line 465
    .line 466
    if-nez p1, :cond_a

    .line 467
    .line 468
    sget v3, Ll/lbc0;->X0:I

    .line 469
    .line 470
    goto :goto_7

    .line 471
    :cond_a
    sget v3, Ll/lbc0;->W0:I

    .line 472
    .line 473
    :goto_7
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 474
    .line 475
    .line 476
    add-int/lit8 p1, p1, 0x1

    .line 477
    .line 478
    goto :goto_4

    .line 479
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Q:Lv/navigationbar/VNavigationTabLayout;

    .line 480
    .line 481
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;

    .line 482
    .line 483
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationTabLayout;->setOnTabSelectedListener(Lv/navigationbar/VNavigationTabLayout$d;)V

    .line 487
    .line 488
    .line 489
    invoke-static {}, Ll/pu20;->k()Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object p1

    .line 493
    invoke-static {}, Ll/cmg;->K()Z

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    if-eqz v0, :cond_e

    .line 498
    .line 499
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 504
    .line 505
    .line 506
    move-result p1

    .line 507
    if-nez p1, :cond_c

    .line 508
    .line 509
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Y:Z

    .line 510
    .line 511
    if-eqz p1, :cond_e

    .line 512
    .line 513
    :cond_c
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 514
    .line 515
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 516
    .line 517
    invoke-virtual {p1, v2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 518
    .line 519
    .line 520
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Y:Z

    .line 521
    .line 522
    if-eqz p1, :cond_d

    .line 523
    .line 524
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Y:Z

    .line 525
    .line 526
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 527
    .line 528
    aget-object p1, p1, v2

    .line 529
    .line 530
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 531
    .line 532
    .line 533
    move-result p1

    .line 534
    if-eqz p1, :cond_e

    .line 535
    .line 536
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 537
    .line 538
    invoke-virtual {p1}, Ll/jka;->oc()Lrx/c;

    .line 539
    .line 540
    .line 541
    :cond_e
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K0:Lrx/subjects/b;

    .line 542
    .line 543
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 544
    .line 545
    .line 546
    move-result-object p1

    .line 547
    new-instance v0, Ll/rbj;

    .line 548
    .line 549
    invoke-direct {v0, p0}, Ll/rbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)V

    .line 550
    .line 551
    .line 552
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 553
    .line 554
    .line 555
    move-result-object p0

    .line 556
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 557
    .line 558
    .line 559
    return-void
.end method

.method public final g6(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->z5()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C5()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 17
    .line 18
    aget-object v1, v1, v0

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    if-ne v1, v0, :cond_1

    .line 29
    .line 30
    aget-object v1, v2, v0

    .line 31
    .line 32
    const/high16 v2, 0x40000000    # 2.0f

    .line 33
    .line 34
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-static {v1, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 42
    .line 43
    aget-object v1, v1, v0

    .line 44
    .line 45
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 53
    .line 54
    aget-object v1, v1, v0

    .line 55
    .line 56
    invoke-static {v1, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 60
    .line 61
    aget-object v1, v1, v0

    .line 62
    .line 63
    invoke-static {v1, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    aget-object v1, v2, v0

    .line 68
    .line 69
    const/high16 v2, 0x40e00000    # 7.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 79
    .line 80
    aget-object v1, v1, v0

    .line 81
    .line 82
    const/high16 v2, 0x41300000    # 11.0f

    .line 83
    .line 84
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 92
    .line 93
    aget-object v1, v1, v0

    .line 94
    .line 95
    const/high16 v2, 0x40a00000    # 5.0f

    .line 96
    .line 97
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 105
    .line 106
    aget-object v1, v1, v0

    .line 107
    .line 108
    const/high16 v2, 0x41100000    # 9.0f

    .line 109
    .line 110
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 115
    .line 116
    .line 117
    :goto_1
    if-nez p1, :cond_2

    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 121
    .line 122
    aget-object p1, p1, v0

    .line 123
    .line 124
    const/4 v1, 0x4

    .line 125
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 129
    .line 130
    aget-object p1, p1, v0

    .line 131
    .line 132
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 136
    .line 137
    aget-object p0, p0, v0

    .line 138
    .line 139
    new-instance p1, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 140
    .line 141
    invoke-direct {p1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 142
    .line 143
    .line 144
    const-string v0, "feed_follow_red_dot.svga"

    .line 145
    .line 146
    const/4 v1, 0x1

    .line 147
    invoke-virtual {p0, v0, v1, p1, v1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final h6(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_4

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x5

    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 18
    .line 19
    const-string v1, "like"

    .line 20
    .line 21
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 25
    .line 26
    const-string v1, "activity_two"

    .line 27
    .line 28
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 32
    .line 33
    const-string v1, "activity_one"

    .line 34
    .line 35
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 39
    .line 40
    const-string v1, "dating"

    .line 41
    .line 42
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    const-string v1, "follow"

    .line 48
    .line 49
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 50
    .line 51
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->M:I

    .line 52
    .line 53
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Landroidx/fragment/app/FragmentManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->m5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public m5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wbj;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o5(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->M:I

    .line 9
    .line 10
    if-ne v0, p1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 v0, 0x1

    .line 14
    if-eq p1, v0, :cond_7

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    if-eq p1, v0, :cond_6

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    if-eq p1, v0, :cond_5

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    if-eq p1, v0, :cond_4

    .line 24
    .line 25
    const/4 v0, 0x5

    .line 26
    if-eq p1, v0, :cond_2

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->f6()V

    .line 36
    .line 37
    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->M:I

    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C5()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->v5()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->u5()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->y5()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_8

    .line 86
    .line 87
    :goto_0
    return-void

    .line 88
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 89
    .line 90
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->z5()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 95
    .line 96
    .line 97
    :goto_1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->M:I

    .line 98
    .line 99
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->F:Z

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->d6(Z)V

    .line 102
    .line 103
    .line 104
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G:Z

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c6(Z)V

    .line 107
    .line 108
    .line 109
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E:Z

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->setUserVisibleHint(Z)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z:Z

    .line 6
    .line 7
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z5()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->e6()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q5()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    return v1

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public r5(I)V
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->z5()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C5()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->z5()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->C5()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 30
    .line 31
    aget-object v1, v1, v0

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    const/4 v3, 0x1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 42
    .line 43
    aget-object v1, v1, v0

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    move v6, v2

    .line 53
    goto :goto_2

    .line 54
    :cond_3
    :goto_1
    move v6, v3

    .line 55
    :goto_2
    new-instance v1, Ll/ayh;

    .line 56
    .line 57
    if-lez p1, :cond_4

    .line 58
    .line 59
    move p1, v3

    .line 60
    goto :goto_3

    .line 61
    :cond_4
    move p1, v2

    .line 62
    :goto_3
    new-instance v4, Ll/ubj;

    .line 63
    .line 64
    invoke-direct {v4, p0, v0}, Ll/ubj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V

    .line 65
    .line 66
    .line 67
    invoke-direct {v1, p1, v4}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Ll/ayh;

    .line 71
    .line 72
    new-instance v4, Ll/vbj;

    .line 73
    .line 74
    invoke-direct {v4, p0, v0}, Ll/vbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p1, v3, v4}, Ll/ayh;-><init>(ZLl/x20;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, p1}, Ll/ayh;->b(Ll/ayh;)Ll/ayh;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ll/ayh;->a()V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->S:[Landroid/widget/ImageView;

    .line 87
    .line 88
    aget-object v5, p1, v0

    .line 89
    .line 90
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_6

    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->T:[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 97
    .line 98
    aget-object p1, p1, v0

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_5

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_5
    move v7, v2

    .line 108
    goto :goto_5

    .line 109
    :cond_6
    :goto_4
    move v7, v3

    .line 110
    :goto_5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E5()I

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->F5()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    move-object v4, p0

    .line 119
    invoke-direct/range {v4 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->t5(Landroid/view/View;ZZILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public s5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->P4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->E:Z

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->setUserVisibleHint(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final u5()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final v5()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public w5()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->H5()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->k(I)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 18
    .line 19
    return-object p0
.end method

.method public x5()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->O:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->U:I

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    invoke-static {}, Ll/pu20;->p()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public y4()V
    .locals 0

    .line 1
    return-void
.end method

.method public final y5()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->P:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pu20;->p()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
