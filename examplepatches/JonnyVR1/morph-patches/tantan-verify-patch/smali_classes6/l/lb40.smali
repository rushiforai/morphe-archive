.class public Ll/lb40;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ub40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/location/Location;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/String;

.field public d:[D


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/lb40;->b:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/lb40;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lb40;->s0(Lrx/Notification;)V

    return-void
.end method

.method public static synthetic f0(Ll/lb40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lb40;->r0()V

    return-void
.end method

.method public static synthetic g0(Ll/lb40;Ljava/lang/String;Lcom/p1/mobile/putong/data/NearbyLocation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lb40;->o0(Ljava/lang/String;Lcom/p1/mobile/putong/data/NearbyLocation;)V

    return-void
.end method

.method public static synthetic h0(Ll/lb40;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lb40;->q0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/lb40;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lb40;->p0(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic r0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ub40;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ub40;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)Lcom/baidu/mapapi/search/core/PoiInfo;
    .locals 5

    .line 1
    new-instance p0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/baidu/mapapi/search/core/PoiInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->province:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->city:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->area:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 25
    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->distance:I

    .line 27
    .line 28
    iput v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->distance:I

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->direction:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->tag:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 39
    .line 40
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 41
    .line 42
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

    .line 43
    .line 44
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 48
    .line 49
    return-object p0
.end method

.method public k0()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/lb40;->l0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    const-string v2, "NEARBY"

    .line 8
    .line 9
    invoke-virtual {v1, v2, p1}, Ll/jka;->N7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/ib40;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/ib40;-><init>(Ll/lb40;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/jb40;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1}, Ll/jb40;-><init>(Ll/lb40;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public m0()V
    .locals 2

    .line 1
    new-instance v0, Ll/gb40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gb40;-><init>(Ll/lb40;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/hb40;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/hb40;-><init>(Ll/lb40;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final n0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->e:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/lb40;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->f:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getDoubleArrayExtra(Ljava/lang/String;)[D

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/lb40;->d:[D

    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;Lcom/p1/mobile/putong/data/NearbyLocation;)V
    .locals 5

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/NearbyLocation;->data:Lcom/p1/mobile/putong/data/NearbyLocationList;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/data/NearbyLocationList;->nearbys:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/data/NearbyLocationInfo;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/data/NearbyLocationInfo;->pois:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    move v1, v0

    .line 21
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-ge v1, v2, :cond_1

    .line 26
    .line 27
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Ll/lb40;->j0(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v3, p0, Ll/lb40;->b:Ljava/util/List;

    .line 38
    .line 39
    new-instance v4, Ll/g90;

    .line 40
    .line 41
    invoke-direct {v4, v2}, Ll/g90;-><init>(Lcom/baidu/mapapi/search/core/PoiInfo;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->h3:I

    .line 55
    .line 56
    invoke-virtual {p2, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p2}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object p2, p0, Ll/lb40;->b:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->h3:I

    .line 76
    .line 77
    invoke-virtual {p2, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-static {p2}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-object p2, p0, Ll/lb40;->b:Ljava/util/List;

    .line 85
    .line 86
    new-instance v1, Ll/g90;

    .line 87
    .line 88
    invoke-direct {v1}, Ll/g90;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-interface {p2, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 95
    .line 96
    check-cast p2, Ll/ub40;

    .line 97
    .line 98
    iget-object v0, p0, Ll/lb40;->b:Ljava/util/List;

    .line 99
    .line 100
    invoke-virtual {p2, v0, p1}, Ll/ub40;->L(Ljava/util/List;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ll/lb40;->b:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final synthetic p0(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/ub40;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string p2, ""

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Ll/ub40;->L(Ljava/util/List;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic q0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lb40;->n0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/ub40;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ub40;->A(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic s0(Lrx/Notification;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 12
    .line 13
    iput-object p1, p0, Ll/lb40;->a:Lcom/p1/mobile/putong/location/Location;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/ub40;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/ub40;->J(Lcom/p1/mobile/putong/location/Location;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->i()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/ub40;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ub40;->I()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public t0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-wide/16 v2, 0x3

    .line 12
    .line 13
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3, v4}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lrx/c;->materialize()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lrx/c;->first()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/kb40;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/kb40;-><init>(Ll/lb40;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method
