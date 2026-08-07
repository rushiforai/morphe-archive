.class public Ll/fxw;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/jxw;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/MessageLocation;

.field public b:Lcom/baidu/mapapi/model/LatLng;

.field public c:Lcom/baidu/mapapi/model/LatLng;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/fxw;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fxw;->i0(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic f0(Ll/fxw;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fxw;->j0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g0(Ll/fxw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic j0(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/c$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setConvertActivityFromTranslucentEnable(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/jxw;

    .line 16
    .line 17
    iget-object v0, p0, Ll/fxw;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 18
    .line 19
    iget-object v1, p0, Ll/fxw;->c:Lcom/baidu/mapapi/model/LatLng;

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Ll/jxw;->f(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/baidu/mapapi/model/LatLng;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/exw;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/exw;-><init>(Ll/fxw;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 48
    .line 49
    const/16 v0, 0x18

    .line 50
    .line 51
    if-eq p1, v0, :cond_0

    .line 52
    .line 53
    const/16 v0, 0x19

    .line 54
    .line 55
    if-ne p1, v0, :cond_4

    .line 56
    .line 57
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/fxw$a;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/fxw$a;-><init>(Ll/fxw;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 71
    .line 72
    if-ne p1, v0, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast p0, Ll/jxw;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/jxw;->n()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 83
    .line 84
    if-ne p1, v0, :cond_3

    .line 85
    .line 86
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 87
    .line 88
    check-cast p0, Ll/jxw;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/jxw;->m()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 95
    .line 96
    if-ne p1, v0, :cond_4

    .line 97
    .line 98
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 99
    .line 100
    check-cast p0, Ll/jxw;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/jxw;->l()V

    .line 103
    .line 104
    .line 105
    :cond_4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dxw;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/dxw;-><init>(Ll/fxw;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 5

    .line 1
    iput-object p1, p0, Ll/fxw;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 6
    .line 7
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 8
    .line 9
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/xc2;->b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/fxw;->c:Lcom/baidu/mapapi/model/LatLng;

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/location/Location;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/xc2;->b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/fxw;->b:Lcom/baidu/mapapi/model/LatLng;

    .line 19
    .line 20
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/jxw;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/jxw;->q(Lcom/baidu/mapapi/model/LatLng;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
