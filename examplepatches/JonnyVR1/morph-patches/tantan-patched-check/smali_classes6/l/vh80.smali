.class public Ll/vh80;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/NearbyLocation;)Ll/g90;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/NearbyLocation;->data:Lcom/p1/mobile/putong/data/NearbyLocationList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/NearbyLocationList;->nearbys:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/NearbyLocationInfo;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfo;->pois:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Ll/g90;

    .line 21
    .line 22
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    .line 27
    .line 28
    invoke-static {p0}, Ll/vh80;->e(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {v1, p0}, Ll/g90;-><init>(Lcom/baidu/mapapi/search/core/PoiInfo;)V

    .line 33
    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/MessageLocation;ILcom/p1/mobile/putong/data/NearbyLocation;)Ljava/util/List;
    .locals 4

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
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_4

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    iget-object v2, v1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_2

    .line 52
    .line 53
    :cond_1
    invoke-static {v1}, Ll/vh80;->c(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)Lcom/p1/mobile/putong/data/MessageLocation;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-lt v1, p1, :cond_0

    .line 65
    .line 66
    :cond_3
    return-object v0

    .line 67
    :cond_4
    new-instance p0, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)Lcom/p1/mobile/putong/data/MessageLocation;
    .locals 6

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {}, Ll/cmg;->U()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    new-instance v1, Lcom/baidu/mapapi/model/LatLng;

    .line 25
    .line 26
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 27
    .line 28
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

    .line 29
    .line 30
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 34
    .line 35
    iget-wide v2, v1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 36
    .line 37
    iget-wide v4, v1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 38
    .line 39
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 40
    .line 41
    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_1
    new-instance v1, Lcom/baidu/mapapi/model/LatLng;

    .line 46
    .line 47
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 48
    .line 49
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

    .line 50
    .line 51
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/xc2;->a(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance v1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 59
    .line 60
    iget-wide v2, p0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 61
    .line 62
    iget-wide v4, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 63
    .line 64
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 65
    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 68
    .line 69
    return-object v0
.end method

.method public static d(Ll/g90;)Lcom/p1/mobile/putong/data/MessageLocation;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/g90;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/g90;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iput-object p0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 27
    .line 28
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)Lcom/baidu/mapapi/search/core/PoiInfo;
    .locals 6

    .line 1
    new-instance v0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/baidu/mapapi/search/core/PoiInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->province:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->city:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->area:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->distance:I

    .line 27
    .line 28
    iput v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->distance:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->direction:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->tag:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v1, Lcom/baidu/mapapi/model/LatLng;

    .line 39
    .line 40
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 41
    .line 42
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

    .line 43
    .line 44
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 45
    .line 46
    .line 47
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 48
    .line 49
    return-object v0
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Ll/g90;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const-string v1, "NEARBY"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/jka;->N7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/th80;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/th80;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/data/MessageLocation;I)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            "I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const-string v1, "NEARBY"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/jka;->N7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/uh80;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/uh80;-><init>(Lcom/p1/mobile/putong/data/MessageLocation;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
