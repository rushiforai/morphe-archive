.class public Ll/eww;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Lcom/baidu/mapapi/map/BaiduMap$OnMapStatusChangeListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/sww;",
        ">;",
        "Lcom/baidu/mapapi/map/BaiduMap$OnMapStatusChangeListener;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ll/bf3;

.field public c:Ll/l3h0;

.field public d:Ljava/lang/String;

.field public e:J

.field public f:Z

.field public g:Lcom/baidu/mapapi/map/Overlay;

.field public h:Lcom/baidu/mapapi/map/BaiduMap;

.field public i:Lcom/baidu/mapapi/map/BitmapDescriptor;

.field public j:Z

.field public k:Lcom/baidu/mapapi/search/geocode/GeoCoder;

.field public l:Lcom/baidu/mapapi/search/poi/PoiSearch;

.field public m:Lcom/baidu/mapapi/map/BitmapDescriptor;

.field public n:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/eww;->e:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/eww;->j:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/eww;->n:Z

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/dww;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/dww;-><init>(Ll/eww;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic C0(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/location/a;->w(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    if-ne p1, v0, :cond_2

    .line 15
    .line 16
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v1, 0x0

    .line 26
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "is_location_success"

    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v0, Ll/sww;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/sww;->G()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "is_search_poi"

    .line 49
    .line 50
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p0, Ll/sww;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/sww;->F()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v1, "is_search_poi_success"

    .line 67
    .line 68
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {p1, v0, p0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "e_map_page_location_info"

    .line 77
    .line 78
    const-string v0, ""

    .line 79
    .line 80
    invoke-static {p1, v0, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method public static synthetic e0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f0(Ll/eww;Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eww;->E0(Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g0(Ll/eww;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eww;->D0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic h0(Ll/eww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eww;->z0()V

    return-void
.end method

.method public static synthetic i0(Ll/eww;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eww;->A0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/eww;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eww;->y0(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/location/Location;)Lcom/baidu/mapapi/model/LatLng;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/eww;->u0(Lcom/p1/mobile/putong/location/Location;)Lcom/baidu/mapapi/model/LatLng;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ll/eww;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eww;->t0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic m0(Ll/eww;Lcom/baidu/mapapi/model/LatLng;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eww;->x0(Lcom/baidu/mapapi/model/LatLng;)V

    return-void
.end method

.method public static synthetic n0(Ll/eww;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eww;->C0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic t0(Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/c$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/bf3;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, p0, v1}, Ll/bf3;-><init>(Ll/eww;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/eww;->b:Ll/bf3;

    .line 15
    .line 16
    new-instance v0, Ll/l3h0;

    .line 17
    .line 18
    iget-object v1, p0, Ll/eww;->b:Ll/bf3;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v3, Ll/sww;

    .line 27
    .line 28
    iget-object v3, v3, Ll/sww;->E:Ll/z20;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2, v3}, Ll/l3h0;-><init>(Ll/bf3;Lcom/p1/mobile/android/app/Act;Ll/z20;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/eww;->c:Ll/l3h0;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 37
    .line 38
    if-ne p1, v0, :cond_1

    .line 39
    .line 40
    iget-boolean v0, p0, Ll/eww;->f:Z

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    new-array v0, v0, [Ll/pf60;

    .line 46
    .line 47
    const-string v1, "e_map_finish_no_location"

    .line 48
    .line 49
    const-string v2, ""

    .line 50
    .line 51
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v0, Ll/sww;

    .line 57
    .line 58
    iget v1, p0, Ll/eww;->a:I

    .line 59
    .line 60
    iget-object v2, p0, Ll/eww;->b:Ll/bf3;

    .line 61
    .line 62
    iget-object p0, p0, Ll/eww;->c:Ll/l3h0;

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2, p0, p1}, Ll/sww;->J(ILl/bf3;Ll/l3h0;Lcom/p1/mobile/android/app/c;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/location/Location;)Lcom/baidu/mapapi/model/LatLng;
    .locals 5

    .line 1
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private synthetic z0()V
    .locals 2

    .line 1
    const-string v0, "checkPermissionDlg"

    .line 2
    .line 3
    const-string v1, "show in MapAct"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->X1(Lcom/p1/mobile/android/app/Act;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final synthetic D0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/eww;->j:Z

    .line 3
    .line 4
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic E0(Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/baidu/mapapi/search/core/PoiInfo;->location:Lcom/baidu/mapapi/model/LatLng;

    .line 8
    .line 9
    iget-object v0, p0, Ll/eww;->b:Ll/bf3;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/bf3;->G()Lcom/baidu/mapapi/model/LatLng;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/eww;->F0(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Z

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

.method public F0(Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Z
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    :cond_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    iget-wide v0, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 10
    .line 11
    iget-wide v2, p2, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 12
    .line 13
    cmpl-double p0, v0, v2

    .line 14
    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    iget-wide p0, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 18
    .line 19
    iget-wide v0, p2, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 20
    .line 21
    cmpl-double p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    :cond_1
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_2
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public G0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sww;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sww;->X()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H0(Ljava/util/List;Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/core/PoiInfo;",
            ">;",
            "Lcom/baidu/mapapi/search/core/PoiInfo;",
            "IIZ)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    check-cast v0, Ll/sww;

    .line 5
    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move v3, p3

    .line 9
    move v4, p4

    .line 10
    move v5, p5

    .line 11
    invoke-virtual/range {v0 .. v5}, Ll/sww;->Y(Ljava/util/List;Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public I0(Landroid/view/Menu;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/sww;

    .line 4
    .line 5
    iget v1, p0, Ll/eww;->a:I

    .line 6
    .line 7
    iget-object v2, p0, Ll/eww;->b:Ll/bf3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/eww;->c:Ll/l3h0;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0, p1}, Ll/sww;->Z(ILl/bf3;Ll/l3h0;Landroid/view/Menu;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public J0(Landroid/content/Intent;)V
    .locals 2

    .line 1
    const-string v0, "android.intent.action.SEARCH"

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "query"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/sww;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Ll/sww;->H(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public L0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/eww;->b:Ll/bf3;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bf3;->G()Lcom/baidu/mapapi/model/LatLng;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "MapActPresenter"

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/eww;->b:Ll/bf3;

    .line 16
    .line 17
    iget-object v2, v0, Ll/bf3;->f:Ljava/util/List;

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    new-array v4, v3, [Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 21
    .line 22
    iget-object v5, v0, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 23
    .line 24
    const/4 v6, 0x0

    .line 25
    aput-object v5, v4, v6

    .line 26
    .line 27
    iget-object v0, v0, Ll/bf3;->i:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    aput-object v0, v4, v5

    .line 31
    .line 32
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-array v3, v3, [Ljava/util/List;

    .line 37
    .line 38
    aput-object v2, v3, v6

    .line 39
    .line 40
    aput-object v0, v3, v5

    .line 41
    .line 42
    invoke-static {v3}, Ll/jyb;->x([Ljava/util/List;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v2, Ll/cww;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/cww;-><init>(Ll/eww;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    const-string v2, "..."

    .line 64
    .line 65
    iget-object v3, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_1

    .line 72
    .line 73
    iget-object v2, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-nez v2, :cond_1

    .line 80
    .line 81
    new-instance v1, Landroid/content/Intent;

    .line 82
    .line 83
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Ll/eww;->b:Ll/bf3;

    .line 87
    .line 88
    invoke-virtual {v2}, Ll/bf3;->G()Lcom/baidu/mapapi/model/LatLng;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-static {v2}, Ll/xc2;->a(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    new-instance v3, Lcom/p1/mobile/putong/data/DoublePair;

    .line 97
    .line 98
    iget-wide v4, v2, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 99
    .line 100
    iget-wide v6, v2, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 101
    .line 102
    invoke-direct {v3, v4, v5, v6, v7}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 103
    .line 104
    .line 105
    const-string v2, "map_location"

    .line 106
    .line 107
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 108
    .line 109
    .line 110
    const-string v2, "map_address"

    .line 111
    .line 112
    iget-object v3, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    iget-object v2, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Oh:I

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-eqz v2, :cond_0

    .line 134
    .line 135
    iget-object v2, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->address:Ljava/lang/String;

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_0
    iget-object v2, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->name:Ljava/lang/String;

    .line 139
    .line 140
    :goto_0
    const-string v3, "map_name"

    .line 141
    .line 142
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    const-string v2, "map_city"

    .line 146
    .line 147
    iget-object v0, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->city:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    const/4 v2, -0x1

    .line 160
    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v2, " AddLocationError  cur = "

    .line 174
    .line 175
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {v1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Lh:I

    .line 189
    .line 190
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_2
    const-string p0, " AddLocationError  adapter is null"

    .line 195
    .line 196
    invoke-static {v1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public N0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sww;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sww;->E(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sww;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sww;->W(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/sww;

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/eww;->n:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/eww;->b:Ll/bf3;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0, p1}, Ll/sww;->b0(ZLl/bf3;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/uvw;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/uvw;-><init>(Ll/eww;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/vvw;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/vvw;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/wvw;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/wvw;-><init>(Ll/eww;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/xxv;->q()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v1, 0x1

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-wide/16 v2, 0x3

    .line 66
    .line 67
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 68
    .line 69
    invoke-virtual {v0, v2, v3, v4}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v2, Ll/xvw;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/xvw;-><init>(Ll/eww;)V

    .line 80
    .line 81
    .line 82
    new-instance v3, Ll/yvw;

    .line 83
    .line 84
    invoke-direct {v3, p0}, Ll/yvw;-><init>(Ll/eww;)V

    .line 85
    .line 86
    .line 87
    const/4 v4, 0x0

    .line 88
    invoke-static {v2, v3, v4}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v2, Ll/zvw;

    .line 100
    .line 101
    invoke-direct {v2, p0}, Ll/zvw;-><init>(Ll/eww;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/aww;

    .line 124
    .line 125
    invoke-direct {v1}, Ll/aww;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v1, Ll/bww;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/bww;-><init>(Ll/eww;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/eww;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public p0()Lcom/baidu/mapapi/map/BitmapDescriptor;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eww;->i:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/BitmapDescriptor;->getBitmap()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/eww;->i:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/BitmapDescriptor;->getBitmap()Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 28
    .line 29
    sget v1, Ll/dbc0;->ou:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/baidu/mapapi/map/BitmapDescriptorFactory;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/eww;->i:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 46
    .line 47
    :cond_1
    iget-object p0, p0, Ll/eww;->i:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 48
    .line 49
    return-object p0
.end method

.method public q0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/eww;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public r0()Lcom/baidu/mapapi/map/BitmapDescriptor;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eww;->m:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/BitmapDescriptor;->getBitmap()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/eww;->m:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/BitmapDescriptor;->getBitmap()Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 28
    .line 29
    sget v1, Ll/dbc0;->pu:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/baidu/mapapi/map/BitmapDescriptorFactory;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/eww;->m:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 46
    .line 47
    :cond_1
    iget-object p0, p0, Ll/eww;->m:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 48
    .line 49
    return-object p0
.end method

.method public s0(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sww;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/sww;->I(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic x0(Lcom/baidu/mapapi/model/LatLng;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " LocationResult latitude = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " longitude = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "MapActPresenter"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Ll/eww;->f:Z

    .line 34
    .line 35
    iget-wide v1, p1, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "location_latitude"

    .line 42
    .line 43
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-wide v2, p1, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 48
    .line 49
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "location_longitude"

    .line 54
    .line 55
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "e_baidu_map_get_location_success"

    .line 64
    .line 65
    const-string v3, ""

    .line 66
    .line 67
    invoke-static {v2, v3, v1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1}, Ll/xc2;->b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v1, p0, Ll/eww;->g:Lcom/baidu/mapapi/map/Overlay;

    .line 75
    .line 76
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_0

    .line 81
    .line 82
    iget-object v1, p0, Ll/eww;->g:Lcom/baidu/mapapi/map/Overlay;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/baidu/mapapi/map/Overlay;->remove()V

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object v1, p0, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 88
    .line 89
    new-instance v2, Lcom/baidu/mapapi/map/MarkerOptions;

    .line 90
    .line 91
    invoke-direct {v2}, Lcom/baidu/mapapi/map/MarkerOptions;-><init>()V

    .line 92
    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-virtual {v2, v3}, Lcom/baidu/mapapi/map/MarkerOptions;->draggable(Z)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2, p1}, Lcom/baidu/mapapi/map/MarkerOptions;->position(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p0}, Ll/eww;->p0()Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v2, v3}, Lcom/baidu/mapapi/map/MarkerOptions;->icon(Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    const/high16 v3, 0x3f000000    # 0.5f

    .line 112
    .line 113
    invoke-virtual {v2, v3, v3}, Lcom/baidu/mapapi/map/MarkerOptions;->anchor(FF)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v1, v2}, Lcom/baidu/mapapi/map/BaiduMap;->addOverlay(Lcom/baidu/mapapi/map/OverlayOptions;)Lcom/baidu/mapapi/map/Overlay;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, p0, Ll/eww;->g:Lcom/baidu/mapapi/map/Overlay;

    .line 122
    .line 123
    iget-boolean v1, p0, Ll/eww;->j:Z

    .line 124
    .line 125
    if-nez v1, :cond_1

    .line 126
    .line 127
    iget-object v1, p0, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 128
    .line 129
    invoke-static {p1}, Lcom/baidu/mapapi/map/MapStatusUpdateFactory;->newLatLng(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MapStatusUpdate;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v1, v2}, Lcom/baidu/mapapi/map/BaiduMap;->setMapStatus(Lcom/baidu/mapapi/map/MapStatusUpdate;)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Ll/eww;->b:Ll/bf3;

    .line 137
    .line 138
    invoke-virtual {v1, p1}, Ll/bf3;->E(Lcom/baidu/mapapi/model/LatLng;)V

    .line 139
    .line 140
    .line 141
    iput-boolean v0, p0, Ll/eww;->j:Z

    .line 142
    .line 143
    :cond_1
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/qxv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/xxv;->o()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->X1(Lcom/p1/mobile/android/app/Act;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
