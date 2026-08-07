.class public Ll/jxw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Lcom/baidu/mapapi/map/BaiduMap$OnMarkerClickListener;
.implements Lcom/baidu/mapapi/map/BaiduMap$OnMapClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fxw;",
        ">;",
        "Lcom/baidu/mapapi/map/BaiduMap$OnMarkerClickListener;",
        "Lcom/baidu/mapapi/map/BaiduMap$OnMapClickListener;"
    }
.end annotation


# instance fields
.field public a:Lcom/baidu/mapapi/map/MapView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Ll/fxw;

.field public e:Lcom/baidu/mapapi/map/BaiduMap;

.field public f:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jxw;->f:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxw;->k(Lcom/baidu/mapapi/model/LatLng;)V

    return-void
.end method

.method public static synthetic b(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxw;->i(Lcom/baidu/mapapi/model/LatLng;)V

    return-void
.end method

.method public static synthetic c(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxw;->j(Lcom/baidu/mapapi/model/LatLng;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jxw;->f:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kxw;->b(Ll/jxw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/fxw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jxw;->d:Ll/fxw;

    .line 2
    .line 3
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/baidu/mapapi/model/LatLng;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/map/MapView;->showZoomControls(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/MapView;->getMap()Lcom/baidu/mapapi/map/BaiduMap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 20
    .line 21
    sget v2, Ll/dbc0;->pu:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/baidu/mapapi/map/BitmapDescriptorFactory;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v2, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 38
    .line 39
    new-instance v3, Lcom/baidu/mapapi/map/MarkerOptions;

    .line 40
    .line 41
    invoke-direct {v3}, Lcom/baidu/mapapi/map/MarkerOptions;-><init>()V

    .line 42
    .line 43
    .line 44
    const/high16 v4, 0x3f000000    # 0.5f

    .line 45
    .line 46
    invoke-virtual {v3, v4, v4}, Lcom/baidu/mapapi/map/MarkerOptions;->anchor(FF)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3, v0}, Lcom/baidu/mapapi/map/MarkerOptions;->icon(Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/map/MarkerOptions;->draggable(Z)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, p2}, Lcom/baidu/mapapi/map/MarkerOptions;->position(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v2, v0}, Lcom/baidu/mapapi/map/BaiduMap;->addOverlay(Lcom/baidu/mapapi/map/OverlayOptions;)Lcom/baidu/mapapi/map/Overlay;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 66
    .line 67
    const/high16 v1, 0x41880000    # 17.0f

    .line 68
    .line 69
    invoke-static {p2, v1}, Lcom/baidu/mapapi/map/MapStatusUpdateFactory;->newLatLngZoom(Lcom/baidu/mapapi/model/LatLng;F)Lcom/baidu/mapapi/map/MapStatusUpdate;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/map/BaiduMap;->setMapStatus(Lcom/baidu/mapapi/map/MapStatusUpdate;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Lcom/baidu/mapapi/map/BaiduMap;->setOnMarkerClickListener(Lcom/baidu/mapapi/map/BaiduMap$OnMarkerClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Lcom/baidu/mapapi/map/BaiduMap;->setOnMapClickListener(Lcom/baidu/mapapi/map/BaiduMap$OnMapClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/jxw;->c:Lv/VText;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/jxw;->c:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/jxw;->c:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/view/View;->buildDrawingCache()V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/jxw;->b:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    new-instance v0, Ll/hxw;

    .line 106
    .line 107
    invoke-direct {v0, p0, p2}, Ll/hxw;-><init>(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p1, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final synthetic i(Lcom/baidu/mapapi/model/LatLng;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jxw;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->x(Landroid/view/View;I)Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 9
    .line 10
    new-instance v1, Lcom/baidu/mapapi/map/MarkerOptions;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/baidu/mapapi/map/MarkerOptions;-><init>()V

    .line 13
    .line 14
    .line 15
    const/high16 v2, 0x3f000000    # 0.5f

    .line 16
    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {v1, v2, v3}, Lcom/baidu/mapapi/map/MarkerOptions;->anchor(FF)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0}, Lcom/baidu/mapapi/map/BitmapDescriptorFactory;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Lcom/baidu/mapapi/map/MarkerOptions;->icon(Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/map/MarkerOptions;->draggable(Z)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Lcom/baidu/mapapi/map/MarkerOptions;->position(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/baidu/mapapi/map/BaiduMap;->addOverlay(Lcom/baidu/mapapi/map/OverlayOptions;)Lcom/baidu/mapapi/map/Overlay;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fxw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jxw;->e(Ll/fxw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jxw;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j(Lcom/baidu/mapapi/model/LatLng;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jxw;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->p0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/ixw;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/ixw;-><init>(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p0, 0x12c

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic k(Lcom/baidu/mapapi/model/LatLng;)V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 6
    .line 7
    sget v1, Ll/dbc0;->ou:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/baidu/mapapi/map/BitmapDescriptorFactory;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/jxw;->e:Lcom/baidu/mapapi/map/BaiduMap;

    .line 24
    .line 25
    new-instance v1, Lcom/baidu/mapapi/map/MarkerOptions;

    .line 26
    .line 27
    invoke-direct {v1}, Lcom/baidu/mapapi/map/MarkerOptions;-><init>()V

    .line 28
    .line 29
    .line 30
    const/high16 v2, 0x3f000000    # 0.5f

    .line 31
    .line 32
    invoke-virtual {v1, v2, v2}, Lcom/baidu/mapapi/map/MarkerOptions;->anchor(FF)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1, v0}, Lcom/baidu/mapapi/map/MarkerOptions;->icon(Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Lcom/baidu/mapapi/map/MarkerOptions;->draggable(Z)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p1}, Lcom/baidu/mapapi/map/MarkerOptions;->position(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MarkerOptions;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lcom/baidu/mapapi/map/BaiduMap;->addOverlay(Lcom/baidu/mapapi/map/OverlayOptions;)Lcom/baidu/mapapi/map/Overlay;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

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
    iget-object p0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/baidu/mapapi/map/MapView;->onDestroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

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
    iget-object p0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/baidu/mapapi/map/MapView;->onPause()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

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
    iget-object p0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/baidu/mapapi/map/MapView;->onResume()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/baidu/mapapi/map/MapView;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jxw;->a:Lcom/baidu/mapapi/map/MapView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/baidu/mapapi/map/MapView;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public q(Lcom/baidu/mapapi/model/LatLng;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/gxw;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/gxw;-><init>(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 p0, 0x12c

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
