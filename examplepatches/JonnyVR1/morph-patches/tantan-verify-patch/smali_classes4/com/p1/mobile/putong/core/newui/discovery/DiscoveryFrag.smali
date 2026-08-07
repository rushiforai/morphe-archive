.class public Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"


# instance fields
.field public B:Landroid/widget/FrameLayout;

.field public C:Landroid/widget/TextView;

.field public D:Landroid/widget/RelativeLayout;

.field public E:Landroid/widget/LinearLayout;

.field public F:Lv/VText;

.field public G:Landroid/widget/FrameLayout;

.field public H:Landroid/widget/FrameLayout;

.field public I:Lv/VDraweeView;

.field public J:Landroid/view/ViewStub;

.field public K:Ll/mxd0;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "latestUnreadMomentInNewUi"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-direct {v0, v1, v2, v3}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->K:Ll/mxd0;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->g5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->f5(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;Ll/bkj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->e5(Ll/bkj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y4(Ll/mge$a;)Landroid/util/Pair;
    .locals 2

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "moment"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/mge;->k(Lcom/p1/mobile/putong/data/BannerLoc;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "moment_feed"

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/mge;->k(Lcom/p1/mobile/putong/data/BannerLoc;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic Z4(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/app/Activity;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMomentsFeedAct(Landroid/app/Activity;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic a5(Ll/vg60;Ljava/lang/Boolean;Ljava/lang/Double;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic g5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->h5(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static h5(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v1, v0}, Ll/fsb0;->u0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsFeedAct(Landroid/content/Context;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public c5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/p3e;->b(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d5()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMoments(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/m3e;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/m3e;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->K:Ll/mxd0;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/hxd0;->obs()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-instance v3, Ll/n3e;

    .line 35
    .line 36
    invoke-direct {v3}, Ll/n3e;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/o3e;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/o3e;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final synthetic e5(Ll/bkj0;)Lrx/c;
    .locals 8

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/vg60;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 31
    .line 32
    iget-wide v4, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 33
    .line 34
    iget-object v6, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v6, Ljava/lang/Double;

    .line 37
    .line 38
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    .line 39
    .line 40
    .line 41
    move-result-wide v6

    .line 42
    cmpg-double v4, v4, v6

    .line 43
    .line 44
    if-gtz v4, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-nez v4, :cond_0

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    :goto_0
    move-object v2, v3

    .line 65
    :goto_1
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->K:Ll/mxd0;

    .line 74
    .line 75
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 76
    .line 77
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    invoke-static {v3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 92
    .line 93
    iget-object p1, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_4
    invoke-static {v3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method

.method public f4()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->d5()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ll/i3e;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/i3e;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v2, v2, Ll/mge;->a:Lrx/subjects/a;

    .line 32
    .line 33
    new-instance v3, Ll/j3e;

    .line 34
    .line 35
    invoke-direct {v3}, Ll/j3e;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Ll/k3e;

    .line 43
    .line 44
    invoke-direct {v3}, Ll/k3e;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/l3e;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/l3e;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic f5(Ll/bkj0;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->F:Lv/VText;

    .line 10
    .line 11
    invoke-static {v0}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->F:Lv/VText;

    .line 19
    .line 20
    const/high16 v2, 0x40000000    # 2.0f

    .line 21
    .line 22
    const/16 v3, 0x63

    .line 23
    .line 24
    if-le v0, v3, :cond_0

    .line 25
    .line 26
    const/high16 v3, 0x40800000    # 4.0f

    .line 27
    .line 28
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1, v4, v5, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v1, v3, v4, v5, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 65
    .line 66
    .line 67
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->F:Lv/VText;

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    const/4 v3, 0x0

    .line 71
    if-lez v0, :cond_1

    .line 72
    .line 73
    move v4, v2

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    move v4, v3

    .line 76
    :goto_1
    invoke-static {v1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const/4 v4, 0x3

    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    invoke-static {}, Ll/f7e;->a()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_2

    .line 95
    .line 96
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 97
    .line 98
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Ljava/lang/Integer;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-le v1, v4, :cond_3

    .line 109
    .line 110
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 115
    .line 116
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 117
    .line 118
    invoke-virtual {v1, v5, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->k7(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 119
    .line 120
    .line 121
    :cond_3
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_4

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->H:Landroid/widget/FrameLayout;

    .line 132
    .line 133
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 137
    .line 138
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->I:Lv/VDraweeView;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    invoke-virtual {v1, v5, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_4
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    const-string v5, "moment_feed"

    .line 157
    .line 158
    invoke-static {v5}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    invoke-virtual {v1, v6}, Ll/mge;->k(Lcom/p1/mobile/putong/data/BannerLoc;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-nez v1, :cond_5

    .line 167
    .line 168
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 169
    .line 170
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->I:Lv/VDraweeView;

    .line 171
    .line 172
    invoke-virtual {v1, v5}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->H:Landroid/widget/FrameLayout;

    .line 176
    .line 177
    const/4 v5, 0x4

    .line 178
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 179
    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->H:Landroid/widget/FrameLayout;

    .line 183
    .line 184
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 185
    .line 186
    .line 187
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-static {v5}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    invoke-virtual {v1, v5}, Ll/mge;->m(Lcom/p1/mobile/putong/data/BannerLoc;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    if-nez v5, :cond_6

    .line 204
    .line 205
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 206
    .line 207
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->I:Lv/VDraweeView;

    .line 208
    .line 209
    invoke-virtual {v5, v6, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    if-eqz v1, :cond_9

    .line 221
    .line 222
    invoke-static {}, Ll/f7e;->a()Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-eqz v1, :cond_7

    .line 227
    .line 228
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 229
    .line 230
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    check-cast v1, Ljava/lang/Integer;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    if-le v1, v4, :cond_9

    .line 241
    .line 242
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 247
    .line 248
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 249
    .line 250
    if-eqz p1, :cond_8

    .line 251
    .line 252
    if-nez v0, :cond_8

    .line 253
    .line 254
    goto :goto_3

    .line 255
    :cond_8
    move v2, v3

    .line 256
    :goto_3
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->e7(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 257
    .line 258
    .line 259
    :cond_9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->B:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    new-array v0, v0, [Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aput-object p1, v0, v1

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->D:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    new-instance v0, Ll/h3e;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/h3e;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/discovery/DiscoveryFrag;->c5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_explore_view"

    .line 2
    .line 3
    return-object p0
.end method
