.class public Ll/xco;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rdo;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:Ljava/lang/String;

.field public d:Ll/xww;

.field public e:Ll/xww;

.field public f:Z

.field public g:Z

.field public h:Ll/m3h0;

.field public final i:Landroid/location/Geocoder;

.field public final j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/android/gms/maps/model/LatLng;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

.field public m:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/xco;->j:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/xco;->k:Lrx/subjects/a;

    .line 15
    .line 16
    new-instance p1, Landroid/location/Geocoder;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 19
    .line 20
    invoke-direct {p1, v0}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/xco;->i:Landroid/location/Geocoder;

    .line 24
    .line 25
    new-instance p1, Ll/m3h0;

    .line 26
    .line 27
    new-instance v0, Ll/wco;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/wco;-><init>(Ll/xco;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p1, p2, v0}, Ll/m3h0;-><init>(Landroid/content/Context;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/xco;->h:Ll/m3h0;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic A0(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic C0(Ll/xco;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->U0(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static bridge synthetic D0(Ll/xco;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xco;->j:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic E0(Ll/xco;Ll/xww;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->o1(Ll/xww;)V

    return-void
.end method

.method public static synthetic F0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic I0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O0(Ll/xco;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic a1(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setConvertActivityFromTranslucentEnable(Z)V

    .line 7
    .line 8
    .line 9
    iget p1, p0, Ll/xco;->a:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Q1:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p1, Ll/rdo;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/rdo;->r()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p1, Ll/rdo;

    .line 41
    .line 42
    new-instance v0, Ll/xco$a;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/xco$a;-><init>(Ll/xco;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ll/rdo;->I(Ll/hyl$a;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p1, Ll/rdo;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/rdo;->Q()Ll/hyl;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1}, Ll/hyl;->E3()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/jco;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/jco;-><init>(Ll/xco;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/kco;

    .line 72
    .line 73
    invoke-direct {v0}, Ll/kco;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v0, Ll/lco;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/lco;-><init>(Ll/xco;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance v0, Ll/nco;

    .line 94
    .line 95
    invoke-direct {v0, p0}, Ll/nco;-><init>(Ll/xco;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast p1, Ll/rdo;

    .line 113
    .line 114
    iget-object v0, p0, Ll/xco;->h:Ll/m3h0;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ll/rdo;->m0(Ll/m3h0;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 120
    .line 121
    check-cast p1, Ll/rdo;

    .line 122
    .line 123
    new-instance v0, Ll/oco;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/oco;-><init>(Ll/xco;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ll/rdo;->T(Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public static synthetic e0(DDLandroid/location/Address;)Landroid/location/Address;
    .locals 0

    .line 1
    invoke-virtual {p4, p0, p1}, Landroid/location/Address;->setLatitude(D)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4, p2, p3}, Landroid/location/Address;->setLongitude(D)V

    .line 5
    .line 6
    .line 7
    return-object p4
.end method

.method public static synthetic f0(Ll/xco;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->V0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/xco;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xco;->i1()V

    return-void
.end method

.method public static synthetic h0(Ll/xco;Landroid/location/Address;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->R0(Landroid/location/Address;)V

    return-void
.end method

.method public static synthetic i0(Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private i1()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/xco;->e:Ll/xww;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/xco;->e:Ll/xww;

    .line 10
    .line 11
    const-string v1, "..."

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xww;->c()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/xww;->c()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    new-instance v2, Landroid/content/Intent;

    .line 44
    .line 45
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v3, Lcom/p1/mobile/putong/data/DoublePair;

    .line 49
    .line 50
    iget-object v4, p0, Ll/xco;->e:Ll/xww;

    .line 51
    .line 52
    invoke-virtual {v4}, Ll/xww;->d()D

    .line 53
    .line 54
    .line 55
    move-result-wide v4

    .line 56
    iget-object p0, p0, Ll/xco;->e:Ll/xww;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xww;->e()D

    .line 59
    .line 60
    .line 61
    move-result-wide v6

    .line 62
    invoke-direct {v3, v4, v5, v6, v7}, Lcom/p1/mobile/putong/data/DoublePair;-><init>(DD)V

    .line 63
    .line 64
    .line 65
    const-string p0, "map_location"

    .line 66
    .line 67
    invoke-virtual {v2, p0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    const-string p0, "map_address"

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/xww;->c()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v2, p0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ll/xww;->f()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Oh:I

    .line 84
    .line 85
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_0

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/xww;->c()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    goto :goto_0

    .line 100
    :cond_0
    invoke-virtual {v0}, Ll/xww;->f()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    :goto_0
    const-string v3, "map_name"

    .line 105
    .line 106
    invoke-virtual {v2, v3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    const-string p0, "map_city"

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/xww;->f()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v2, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    const/4 p0, -0x1

    .line 119
    invoke-virtual {v1, p0, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Lh:I

    .line 127
    .line 128
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Lh:I

    .line 133
    .line 134
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 135
    .line 136
    .line 137
    :cond_3
    return-void
.end method

.method public static synthetic j0(Ll/xco;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->Y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/xco;Lcom/p1/mobile/putong/location/Location;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->W0(Lcom/p1/mobile/putong/location/Location;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(DDLjava/lang/Throwable;)Landroid/location/Address;
    .locals 1

    .line 1
    new-instance p4, Landroid/location/Address;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p4, v0}, Landroid/location/Address;-><init>(Ljava/util/Locale;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "%s,%s"

    .line 23
    .line 24
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p4, p1, p0}, Landroid/location/Address;->setAddressLine(ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object p4
.end method

.method public static synthetic m0(Ll/xco;DD)Landroid/location/Address;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xco;->f1(DD)Landroid/location/Address;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n0(Ll/xco;Ll/xww;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->c1(Ll/xww;)V

    return-void
.end method

.method private n1(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xco;->f:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/xco;->f:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/rdo;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/rdo;->n0(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic o0(Ll/xco;Landroid/location/Address;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->X0(Landroid/location/Address;)V

    return-void
.end method

.method public static synthetic p0(Ll/xco;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->S0(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q0(Ll/xco;Ll/lxw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->d1(Ll/lxw;)V

    return-void
.end method

.method public static synthetic r0(Ll/xco;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->l1(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s0(Ll/xco;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xco;->b1()V

    return-void
.end method

.method public static synthetic t0(Ll/xco;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xco;->a1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic u0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y0(Ll/xco;Lcom/google/android/gms/maps/model/LatLng;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xco;->Q0(Lcom/google/android/gms/maps/model/LatLng;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z0(Ll/xco;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xco;->e1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public P0(IZLjava/lang/String;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xco;->a:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/xco;->b:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/xco;->c:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Q0(Lcom/google/android/gms/maps/model/LatLng;)Lrx/c;
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    .line 2
    .line 3
    iget-wide v2, p1, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/xco;->m1(DD)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic R0(Landroid/location/Address;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Oh:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/location/Address;->setFeatureName(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Landroid/location/Address;->getMaxAddressLineIndex()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-gez v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/location/Address;->getLatitude()D

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1}, Landroid/location/Address;->getLatitude()D

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "%s,%s"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-virtual {p1, v1, v0}, Landroid/location/Address;->setAddressLine(ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-static {p1}, Ll/xww;->a(Landroid/location/Address;)Ll/xww;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/xco;->o1(Ll/xww;)V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x1

    .line 68
    invoke-direct {p0, p1}, Ll/xco;->n1(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic S0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rdo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rdo;->X()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic U0(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xco;->h:Ll/m3h0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/m3h0;->t(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/rdo;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/rdo;->V(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/rdo;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-lez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Ll/rdo;->r0(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic V0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rdo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rdo;->P()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W0(Lcom/p1/mobile/putong/location/Location;)Lrx/c;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/xco;->m1(DD)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic X0(Landroid/location/Address;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rdo;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/location/Address;->getLatitude()D

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {p1}, Landroid/location/Address;->getLongitude()D

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/rdo;->J(DD)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/location/Address;->getMaxAddressLineIndex()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-gez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/location/Address;->getLatitude()D

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Landroid/location/Address;->getLatitude()D

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "%s,%s"

    .line 43
    .line 44
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {p1, v1, v0}, Landroid/location/Address;->setAddressLine(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Fh:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Landroid/location/Address;->setFeatureName(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Ll/xww;->a(Landroid/location/Address;)Ll/xww;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Ll/xco;->o1(Ll/xww;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p0, Ll/rdo;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/rdo;->K()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic Y0(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/xco;->o1(Ll/xww;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    check-cast v0, Ll/rdo;

    .line 18
    .line 19
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/xww;->d()D

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/xww;->e()D

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    const/16 v5, 0x11

    .line 32
    .line 33
    invoke-virtual/range {v0 .. v5}, Ll/rdo;->L(DDI)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 p1, 0x0

    .line 37
    invoke-direct {p0, p1}, Ll/xco;->n1(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/mco;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mco;-><init>(Ll/xco;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/pco;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/pco;-><init>(Ll/xco;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/xco;->j:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/qco;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/qco;-><init>(Ll/xco;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/rco;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/rco;-><init>(Ll/xco;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/xco;->k:Lrx/subjects/a;

    .line 46
    .line 47
    new-instance v1, Ll/sco;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/sco;-><init>(Ll/xco;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/tco;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/tco;-><init>(Ll/xco;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/uco;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/uco;-><init>(Ll/xco;)V

    .line 72
    .line 73
    .line 74
    new-instance p0, Ll/vco;

    .line 75
    .line 76
    invoke-direct {p0}, Ll/vco;-><init>()V

    .line 77
    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-static {v1, p0, v2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final synthetic b1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rdo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rdo;->j0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c1(Ll/xww;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 3
    .line 4
    iput-object v0, p0, Ll/xco;->l:Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

    .line 5
    .line 6
    iput-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/xco;->o1(Ll/xww;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    check-cast v0, Ll/rdo;

    .line 15
    .line 16
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/xww;->d()D

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/xww;->e()D

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    const/16 v5, 0x11

    .line 29
    .line 30
    invoke-virtual/range {v0 .. v5}, Ll/rdo;->L(DDI)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/rdo;

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Ll/rdo;->n0(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic d1(Ll/lxw;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rdo;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, v2}, Ll/rdo;->i0(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/rdo;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Ll/rdo;->S(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/rdo;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ll/rdo;->R(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/lxw;->c()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/xco;->k1(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/hco;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/hco;-><init>(Ll/xco;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/ico;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/ico;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, p0, v2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e1()Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/bnl0;->s(Landroid/view/ViewGroup;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/gco;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/gco;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/view/View;

    .line 37
    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    const/4 v1, 0x3

    .line 51
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    return-object p0
.end method

.method public final synthetic f1(DD)Landroid/location/Address;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xco;->i:Landroid/location/Geocoder;

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    move-wide v1, p1

    .line 5
    move-wide v3, p3

    .line 6
    invoke-virtual/range {v0 .. v5}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/location/Address;

    .line 16
    .line 17
    return-object p0
.end method

.method public g1()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rdo;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rdo;->X()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/rdo;

    .line 14
    .line 15
    const-string v1, ""

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v0, v1, v2}, Ll/rdo;->i0(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/rdo;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Ll/rdo;->S(Z)V

    .line 26
    .line 27
    .line 28
    return v2

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public h1(Landroid/view/Menu;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rdo;

    .line 4
    .line 5
    iget v1, p0, Ll/xco;->a:I

    .line 6
    .line 7
    iget-boolean v2, p0, Ll/xco;->b:Z

    .line 8
    .line 9
    new-instance v3, Ll/cco;

    .line 10
    .line 11
    invoke-direct {v3, p0}, Ll/cco;-><init>(Ll/xco;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1, v1, v2, v3}, Ll/rdo;->U(Landroid/view/Menu;IZLl/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xco;->j1()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/xco;->c:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;->B:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreProduct;->Y:Ll/jxd0;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreProduct;->b0:Ll/jxd0;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_0

    .line 79
    .line 80
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast p0, Ll/rdo;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/rdo;->p0()V

    .line 85
    .line 86
    .line 87
    :cond_0
    const/4 p0, 0x1

    .line 88
    return p0
.end method

.method public j1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/bco;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/bco;-><init>(Ll/xco;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final k1(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/xww;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 14
    .line 15
    iget-object p0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/api/q;->h3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final l1(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/ArrayList<",
            "Ll/lxw;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    new-array p0, p0, [Ll/lxw;

    .line 9
    .line 10
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 28
    .line 29
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 32
    .line 33
    iget-object p0, p0, Ll/xco;->m:Ljava/util/UUID;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/api/q;->i3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final m1(DD)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DD)",
            "Lrx/c<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/dco;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-wide v4, p3

    .line 6
    invoke-direct/range {v0 .. v5}, Ll/dco;-><init>(Ll/xco;DD)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-wide/16 p1, 0x1

    .line 14
    .line 15
    sget-object p3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Ll/eco;

    .line 30
    .line 31
    invoke-direct {p1, v2, v3, v4, v5}, Ll/eco;-><init>(DD)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ll/fco;

    .line 39
    .line 40
    invoke-direct {p1, v2, v3, v4, v5}, Ll/fco;-><init>(DD)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final o1(Ll/xww;)V
    .locals 7

    .line 1
    iput-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 2
    .line 3
    iput-object p1, p0, Ll/xco;->e:Ll/xww;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/rdo;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/rdo;->H(Ll/xww;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    move-object v1, v0

    .line 15
    check-cast v1, Ll/rdo;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/xww;->d()D

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-virtual {p1}, Ll/xww;->e()D

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    iget-object v0, p0, Ll/xco;->d:Ll/xww;

    .line 26
    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    :goto_0
    move v6, p1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const/4 p1, 0x0

    .line 33
    goto :goto_0

    .line 34
    :goto_1
    invoke-virtual/range {v1 .. v6}, Ll/rdo;->l0(DDZ)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p0, Ll/rdo;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/rdo;->s0()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
