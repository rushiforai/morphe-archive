.class public Ll/g90;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/baidu/mapapi/search/core/PoiInfo;

.field public b:Landroid/location/Address;

.field public c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/location/Address;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Ll/g90;->b:Landroid/location/Address;

    return-void
.end method

.method public constructor <init>(Lcom/baidu/mapapi/search/core/PoiInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

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
    iget-object p0, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->getAddress()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object v0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/location/Address;->getMaxAddressLineIndex()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object p0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 44
    .line 45
    if-ltz v0, :cond_2

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_2
    invoke-virtual {p0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_3
    const-string p0, ""

    .line 59
    .line 60
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/data/DoublePair;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

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
    new-instance v0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 10
    .line 11
    iget-object v1, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->pt:Lcom/baidu/mapapi/model/LatLng;

    .line 14
    .line 15
    iget-wide v1, v1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 16
    .line 17
    iget-object p0, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->pt:Lcom/baidu/mapapi/model/LatLng;

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 22
    .line 23
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    iget-object v0, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 36
    .line 37
    iget-object v1, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 40
    .line 41
    iget-wide v1, v1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 42
    .line 43
    iget-object p0, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 46
    .line 47
    iget-wide v3, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 48
    .line 49
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_1
    iget-object v0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 62
    .line 63
    iget-object v1, p0, Ll/g90;->b:Landroid/location/Address;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/location/Address;->getLatitude()D

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    iget-object p0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/location/Address;->getLongitude()D

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 76
    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_2
    const/4 p0, 0x0

    .line 80
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

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
    iget-object p0, p0, Ll/g90;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->key:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/g90;->a:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    iget-object v0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Ll/g90;->b:Landroid/location/Address;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method
