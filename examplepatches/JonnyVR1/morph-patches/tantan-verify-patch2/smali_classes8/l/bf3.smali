.class public Ll/bf3;
.super Ll/dq1;
.source "SourceFile"

# interfaces
.implements Lcom/baidu/mapapi/search/geocode/OnGetGeoCoderResultListener;
.implements Lcom/baidu/mapapi/search/poi/OnGetPoiSearchResultListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/baidu/mapapi/search/core/PoiInfo;",
        ">;",
        "Lcom/baidu/mapapi/search/geocode/OnGetGeoCoderResultListener;",
        "Lcom/baidu/mapapi/search/poi/OnGetPoiSearchResultListener;"
    }
.end annotation


# instance fields
.field public c:Ll/eww;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Z

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/core/PoiInfo;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Lcom/baidu/mapapi/search/core/PoiInfo;

.field public i:Lcom/baidu/mapapi/search/core/PoiInfo;

.field public j:Lcom/baidu/mapapi/model/LatLng;

.field public k:Lcom/baidu/mapapi/model/LatLng;

.field public l:Lcom/baidu/mapapi/model/LatLngBounds;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Lcom/baidu/mapapi/map/Overlay;

.field public p:I

.field public q:Z

.field public r:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/baidu/mapapi/search/core/PoiInfo;",
            ">;"
        }
    .end annotation
.end field

.field public s:Lcom/baidu/mapapi/model/LatLng;


# direct methods
.method public constructor <init>(Ll/eww;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/bf3;->g:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 9
    .line 10
    iput-object v0, p0, Ll/bf3;->k:Lcom/baidu/mapapi/model/LatLng;

    .line 11
    .line 12
    iput-object v0, p0, Ll/bf3;->l:Lcom/baidu/mapapi/model/LatLngBounds;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Ll/bf3;->p:I

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/bf3;->q:Z

    .line 18
    .line 19
    new-instance v0, Ll/ze3;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/ze3;-><init>(Ll/bf3;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/bf3;->r:Ljava/util/Comparator;

    .line 25
    .line 26
    iput-object p1, p0, Ll/bf3;->c:Ll/eww;

    .line 27
    .line 28
    iput-object p2, p0, Ll/bf3;->d:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/bf3;->f:Ljava/util/List;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic p(Ll/bf3;Lcom/baidu/mapapi/search/core/PoiInfo;Lcom/baidu/mapapi/search/core/PoiInfo;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bf3;->w(Lcom/baidu/mapapi/search/core/PoiInfo;Lcom/baidu/mapapi/search/core/PoiInfo;)I

    move-result p0

    return p0
.end method

.method public static synthetic s(Ll/bf3;Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bf3;->y(Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A(D)D
    .locals 2

    .line 1
    const-wide v0, -0x3fa9800000000000L    # -90.0

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    const-wide v0, 0x4056800000000000L    # 90.0

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->min(DD)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    return-wide p0
.end method

.method public B(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;
    .locals 5

    .line 1
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 4
    .line 5
    invoke-virtual {p0, v1, v2}, Ll/bf3;->A(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iget-wide v3, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 10
    .line 11
    invoke-virtual {p0, v3, v4}, Ll/bf3;->C(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    invoke-direct {v0, v1, v2, p0, p1}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public C(D)D
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    const-wide v0, 0x4066800000000000L    # 180.0

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->min(DD)D

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    return-wide p0
.end method

.method public D(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eww;->q0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    iget-object p1, p0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/bf3;->H(Lcom/baidu/mapapi/model/LatLng;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/bf3;->c:Ll/eww;

    .line 29
    .line 30
    iget-object p1, p1, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 31
    .line 32
    iget-object v0, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/baidu/mapapi/map/MapStatusUpdateFactory;->newLatLng(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MapStatusUpdate;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Lcom/baidu/mapapi/map/BaiduMap;->animateMapStatus(Lcom/baidu/mapapi/map/MapStatusUpdate;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 44
    .line 45
    iput-object p1, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_0
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Ll/eww;->O0(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 63
    .line 64
    invoke-virtual {p0, v0, v1}, Ll/bf3;->H(Lcom/baidu/mapapi/model/LatLng;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 68
    .line 69
    iget-object v0, v0, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/BaiduMap;->getMapStatus()Lcom/baidu/mapapi/map/MapStatus;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-nez v0, :cond_1

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    iget v0, v0, Lcom/baidu/mapapi/map/MapStatus;->zoom:F

    .line 80
    .line 81
    :goto_0
    float-to-double v2, v0

    .line 82
    const-wide v4, 0x4030800000000000L    # 16.5

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    cmpl-double v2, v2, v4

    .line 88
    .line 89
    const/high16 v3, 0x41900000    # 18.0f

    .line 90
    .line 91
    if-ltz v2, :cond_2

    .line 92
    .line 93
    cmpg-float v2, v0, v3

    .line 94
    .line 95
    if-gtz v2, :cond_2

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    :goto_1
    iget-object v2, p0, Ll/bf3;->c:Ll/eww;

    .line 103
    .line 104
    iget-object v2, v2, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 105
    .line 106
    iget-object v3, p0, Ll/bf3;->f:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 113
    .line 114
    iget-object v3, v3, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 115
    .line 116
    invoke-static {v3, v0}, Lcom/baidu/mapapi/map/MapStatusUpdateFactory;->newLatLngZoom(Lcom/baidu/mapapi/model/LatLng;F)Lcom/baidu/mapapi/map/MapStatusUpdate;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v2, v0}, Lcom/baidu/mapapi/map/BaiduMap;->animateMapStatus(Lcom/baidu/mapapi/map/MapStatusUpdate;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 132
    .line 133
    iput-object v0, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 134
    .line 135
    iget-object v0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 142
    .line 143
    iget-object v2, p0, Ll/bf3;->f:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    check-cast v3, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 150
    .line 151
    invoke-interface {v2, p1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/bf3;->f:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {p1, v1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    :cond_3
    :goto_2
    invoke-virtual {p0}, Ll/bf3;->notifyDataSetChanged()V

    .line 160
    .line 161
    .line 162
    :cond_4
    return-void
.end method

.method public E(Lcom/baidu/mapapi/model/LatLng;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/eww;->N0(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/eww;->G0()V

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p0, Ll/bf3;->g:Z

    .line 13
    .line 14
    iput-boolean v1, p0, Ll/bf3;->e:Z

    .line 15
    .line 16
    iput-object p1, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 17
    .line 18
    iput-object p1, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/bf3;->z(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLngBounds;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/bf3;->l:Lcom/baidu/mapapi/model/LatLngBounds;

    .line 25
    .line 26
    new-instance v0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 27
    .line 28
    invoke-direct {v0}, Lcom/baidu/mapapi/search/core/PoiInfo;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 32
    .line 33
    iget-object v1, p0, Ll/bf3;->d:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Fh:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 44
    .line 45
    iget-object v1, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput v0, p0, Ll/bf3;->p:I

    .line 51
    .line 52
    const-string v1, ""

    .line 53
    .line 54
    iput-object v1, p0, Ll/bf3;->m:Ljava/lang/String;

    .line 55
    .line 56
    iput-boolean v0, p0, Ll/bf3;->q:Z

    .line 57
    .line 58
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 59
    .line 60
    iget-object v0, v0, Ll/eww;->k:Lcom/baidu/mapapi/search/geocode/GeoCoder;

    .line 61
    .line 62
    new-instance v1, Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;

    .line 63
    .line 64
    invoke-direct {v1}, Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, p1}, Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;->location(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v0, p1}, Lcom/baidu/mapapi/search/geocode/GeoCoder;->reverseGeoCode(Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;)Z

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/bf3;->c:Ll/eww;

    .line 75
    .line 76
    iget-object p1, p1, Ll/eww;->l:Lcom/baidu/mapapi/search/poi/PoiSearch;

    .line 77
    .line 78
    new-instance v0, Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;

    .line 79
    .line 80
    invoke-direct {v0}, Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Ll/bf3;->l:Lcom/baidu/mapapi/model/LatLngBounds;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;->bound(Lcom/baidu/mapapi/model/LatLngBounds;)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "\u7f8e\u98df"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;->keyword(Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/16 v1, 0x13

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;->pageCapacity(I)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p1, v0}, Lcom/baidu/mapapi/search/poi/PoiSearch;->searchInBound(Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;)Z

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ll/bf3;->notifyDataSetChanged()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bf3;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/bf3;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 29
    .line 30
    iget-object v1, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 31
    .line 32
    iget-object v2, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Ll/eww;->F0(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    invoke-virtual {p0, v0}, Ll/bf3;->D(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 46
    .line 47
    new-instance v1, Ll/af3;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/af3;-><init>(Ll/bf3;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-ltz v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/bf3;->D(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public G()Lcom/baidu/mapapi/model/LatLng;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eww;->q0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/bf3;->k:Lcom/baidu/mapapi/model/LatLng;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 13
    .line 14
    return-object p0
.end method

.method public final H(Lcom/baidu/mapapi/model/LatLng;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bf3;->o:Lcom/baidu/mapapi/map/Overlay;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Ll/bf3;->o:Lcom/baidu/mapapi/map/Overlay;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/baidu/mapapi/map/Overlay;->remove()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/bf3;->o:Lcom/baidu/mapapi/map/Overlay;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    iget-object p2, p0, Ll/bf3;->o:Lcom/baidu/mapapi/map/Overlay;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/baidu/mapapi/map/Overlay;->remove()V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/bf3;->o:Lcom/baidu/mapapi/map/Overlay;

    .line 32
    .line 33
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    iget-object p2, p0, Ll/bf3;->c:Ll/eww;

    .line 40
    .line 41
    iget-object p2, p2, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 42
    .line 43
    new-instance v0, Lcom/baidu/mapapi/map/MarkerOptions;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/baidu/mapapi/map/MarkerOptions;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/bf3;->c:Ll/eww;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/eww;->r0()Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/map/MarkerOptions;->icon(Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/high16 v1, 0x3f000000    # 0.5f

    .line 59
    .line 60
    invoke-virtual {v0, v1, v1}, Lcom/baidu/mapapi/map/MarkerOptions;->anchor(FF)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, p1}, Lcom/baidu/mapapi/map/MarkerOptions;->position(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p1, v0}, Lcom/baidu/mapapi/map/MarkerOptions;->draggable(Z)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p2, p1}, Lcom/baidu/mapapi/map/BaiduMap;->addOverlay(Lcom/baidu/mapapi/map/OverlayOptions;)Lcom/baidu/mapapi/map/Overlay;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Ll/bf3;->o:Lcom/baidu/mapapi/map/Overlay;

    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public I(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eww;->q0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/eww;->P0(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/eww;->N0(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/eww;->G0()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Ll/bf3;->g:Z

    .line 27
    .line 28
    iput-boolean v1, p0, Ll/bf3;->e:Z

    .line 29
    .line 30
    iget-object p1, p1, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->key:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p1, p0, Ll/bf3;->m:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p2, p0, Ll/bf3;->n:Ljava/lang/String;

    .line 35
    .line 36
    new-array p1, v1, [Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 37
    .line 38
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/bf3;->f:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/bf3;->notifyDataSetChanged()V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 49
    .line 50
    iget-object p1, p0, Ll/bf3;->c:Ll/eww;

    .line 51
    .line 52
    iget-object p1, p1, Ll/eww;->l:Lcom/baidu/mapapi/search/poi/PoiSearch;

    .line 53
    .line 54
    new-instance p2, Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;

    .line 55
    .line 56
    invoke-direct {p2}, Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ll/bf3;->n:Ljava/lang/String;

    .line 60
    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    const-string v1, ""

    .line 64
    .line 65
    :cond_1
    invoke-virtual {p2, v1}, Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;->city(Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    iget-object p0, p0, Ll/bf3;->m:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;->keyword(Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    xor-int/lit8 p2, p3, 0x1

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;->cityLimit(Z)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/16 p2, 0x14

    .line 82
    .line 83
    invoke-virtual {p0, p2}, Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;->pageCapacity(I)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Lcom/baidu/mapapi/search/poi/PoiSearch;->searchInCity(Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;)Z

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean p0, p0, Ll/bf3;->g:Z

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bf3;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bf3;->t(Landroid/view/View;Lcom/baidu/mapapi/search/core/PoiInfo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/eww;->s0(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public notifyDataSetChanged()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bf3;->f:Ljava/util/List;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 8
    .line 9
    iget-object v4, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 10
    .line 11
    invoke-virtual {v0, v3, v4}, Ll/eww;->F0(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Z

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, -0x1

    .line 17
    invoke-virtual/range {v0 .. v5}, Ll/eww;->H0(Ljava/util/List;Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public t(Landroid/view/View;Lcom/baidu/mapapi/search/core/PoiInfo;II)V
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;

    .line 4
    .line 5
    iget-object p3, p2, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 6
    .line 7
    iget-object v0, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 8
    .line 9
    invoke-static {p3, v0}, Lcom/baidu/mapapi/utils/DistanceUtil;->getDistance(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)D

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    double-to-int p3, v0

    .line 14
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 15
    .line 16
    iget-object v1, p2, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 17
    .line 18
    iget-object p0, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Ll/eww;->F0(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p1, p2, p3, p4, p0}, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->R(Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic w(Lcom/baidu/mapapi/search/core/PoiInfo;Lcom/baidu/mapapi/search/core/PoiInfo;)I
    .locals 4

    .line 1
    iget-object p0, p0, Ll/bf3;->j:Lcom/baidu/mapapi/model/LatLng;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 6
    .line 7
    invoke-static {p1, p0}, Lcom/baidu/mapapi/utils/DistanceUtil;->getDistance(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {p2, p0}, Lcom/baidu/mapapi/utils/DistanceUtil;->getDistance(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)D

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmpl-double p0, v0, v2

    .line 16
    .line 17
    if-nez p0, :cond_3

    .line 18
    .line 19
    iget-wide v0, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 20
    .line 21
    iget-wide v2, p2, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 22
    .line 23
    cmpl-double p0, v0, v2

    .line 24
    .line 25
    const/4 v0, -0x1

    .line 26
    const/4 v1, 0x1

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    iget-wide p0, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 30
    .line 31
    iget-wide v2, p2, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 32
    .line 33
    cmpl-double p0, p0, v2

    .line 34
    .line 35
    if-lez p0, :cond_0

    .line 36
    .line 37
    return v1

    .line 38
    :cond_0
    return v0

    .line 39
    :cond_1
    iget-wide p0, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 40
    .line 41
    iget-wide v2, p2, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 42
    .line 43
    cmpl-double p0, p0, v2

    .line 44
    .line 45
    if-lez p0, :cond_2

    .line 46
    .line 47
    return v1

    .line 48
    :cond_2
    return v0

    .line 49
    :cond_3
    sub-double/2addr v0, v2

    .line 50
    double-to-int p0, v0

    .line 51
    return p0
.end method

.method public final synthetic y(Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bf3;->c:Ll/eww;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bf3;->s:Lcom/baidu/mapapi/model/LatLng;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/eww;->F0(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public z(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLngBounds;
    .locals 8

    .line 1
    new-instance v0, Lcom/baidu/mapapi/model/LatLngBounds$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/baidu/mapapi/model/LatLngBounds$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/baidu/mapapi/model/LatLng;

    .line 7
    .line 8
    iget-wide v2, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 9
    .line 10
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 11
    .line 12
    sub-double/2addr v2, v4

    .line 13
    iget-wide v6, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 14
    .line 15
    sub-double/2addr v6, v4

    .line 16
    invoke-direct {v1, v2, v3, v6, v7}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/bf3;->B(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/model/LatLngBounds$Builder;->include(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLngBounds$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Lcom/baidu/mapapi/model/LatLng;

    .line 28
    .line 29
    iget-wide v2, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 30
    .line 31
    add-double/2addr v2, v4

    .line 32
    iget-wide v6, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 33
    .line 34
    add-double/2addr v6, v4

    .line 35
    invoke-direct {v1, v2, v3, v6, v7}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/bf3;->B(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lcom/baidu/mapapi/model/LatLngBounds$Builder;->include(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLngBounds$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/baidu/mapapi/model/LatLngBounds$Builder;->build()Lcom/baidu/mapapi/model/LatLngBounds;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method
