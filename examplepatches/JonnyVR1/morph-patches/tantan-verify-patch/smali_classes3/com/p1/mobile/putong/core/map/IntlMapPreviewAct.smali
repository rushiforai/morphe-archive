.class public Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;
.super Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;
.source "SourceFile"

# interfaces
.implements Ll/um50;
.implements Ll/w6k$d;
.implements Ll/w6k$c;
.implements Ll/crl;


# instance fields
.field public e:Lcom/google/android/gms/maps/model/LatLng;

.field public f:Lcom/p1/mobile/putong/data/MessageLocation;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d2(Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p2, v0}, Ll/bnl0;->x(Landroid/view/View;I)Landroid/graphics/Bitmap;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 9
    .line 10
    .line 11
    const/high16 v1, 0x3f000000    # 0.5f

    .line 12
    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/maps/model/MarkerOptions;->g(FF)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p2}, Ll/r13;->a(Landroid/graphics/Bitmap;)Ll/q13;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {v0, p2}, Lcom/google/android/gms/maps/model/MarkerOptions;->n0(Ll/q13;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p2, v0}, Lcom/google/android/gms/maps/model/MarkerOptions;->h(Z)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->r0(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/w6k;->a(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/txw;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;Ll/w6k;Ll/q13;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->h2(Ll/w6k;Ll/q13;Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method


# virtual methods
.method public N(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->Y(Ll/txw;)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public P2(Ll/w6k;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/w6k;->e()Ll/dsj0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/dsj0;->b(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 14
    .line 15
    sget v1, Ll/dbc0;->ou:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/r13;->a(Landroid/graphics/Bitmap;)Ll/q13;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/yco;

    .line 43
    .line 44
    invoke-direct {v2, p0, p1, v0}, Ll/yco;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;Ll/w6k;Ll/q13;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->f:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 57
    .line 58
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->g2(Ll/w6k;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public Y(Ll/txw;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/bdo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bdo;->g0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public a2(Lcom/p1/mobile/putong/data/MessageLocation;DD)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->f:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    new-instance p1, Lcom/google/android/gms/maps/model/LatLng;

    .line 4
    .line 5
    invoke-direct {p1, p2, p3, p4, p5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/gms/maps/SupportMapFragment;->W3()Lcom/google/android/gms/maps/SupportMapFragment;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    sget p3, Ll/adc0;->R7:I

    .line 23
    .line 24
    invoke-virtual {p2, p3, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Landroidx/fragment/app/k;->i()I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p0}, Lcom/google/android/gms/maps/SupportMapFragment;->V3(Ll/um50;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public g2(Ll/w6k;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 6
    .line 7
    sget v1, Ll/dbc0;->pu:I

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
    invoke-static {v0}, Ll/r13;->a(Landroid/graphics/Bitmap;)Ll/q13;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 26
    .line 27
    .line 28
    const/high16 v2, 0x3f000000    # 0.5f

    .line 29
    .line 30
    invoke-virtual {v1, v2, v2}, Lcom/google/android/gms/maps/model/MarkerOptions;->g(FF)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/model/MarkerOptions;->n0(Ll/q13;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->h(Z)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, p3}, Lcom/google/android/gms/maps/model/MarkerOptions;->r0(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Ll/w6k;->a(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/txw;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/w6k;->j(Ll/w6k$d;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ll/w6k;->i(Ll/w6k$c;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Ll/adc0;->R7:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_0

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    new-instance v2, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;

    .line 89
    .line 90
    invoke-direct {v2, p0, v0, p1, p3}, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;Landroid/view/View;Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 94
    .line 95
    .line 96
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 97
    .line 98
    check-cast p0, Ll/edo;

    .line 99
    .line 100
    new-instance v0, Ll/zco;

    .line 101
    .line 102
    invoke-direct {v0, p1, p3}, Ll/zco;-><init>(Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p2, v0}, Ll/edo;->j(Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final synthetic h2(Ll/w6k;Ll/q13;Lcom/p1/mobile/putong/location/Location;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {p3}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->i2(Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;Ll/q13;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public i2(Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;Ll/q13;)V
    .locals 1

    .line 1
    new-instance p0, Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x3f000000    # 0.5f

    .line 7
    .line 8
    invoke-virtual {p0, v0, v0}, Lcom/google/android/gms/maps/model/MarkerOptions;->g(FF)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p3}, Lcom/google/android/gms/maps/model/MarkerOptions;->n0(Ll/q13;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p3, 0x0

    .line 17
    invoke-virtual {p0, p3}, Lcom/google/android/gms/maps/model/MarkerOptions;->h(Z)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p2}, Lcom/google/android/gms/maps/model/MarkerOptions;->r0(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Ll/w6k;->a(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/txw;

    .line 26
    .line 27
    .line 28
    return-void
.end method
