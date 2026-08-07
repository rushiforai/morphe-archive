.class public Ll/gsl0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/psl0;",
        ">;"
    }
.end annotation


# static fields
.field public static h:D = 1.0E-4


# instance fields
.field public a:Lcom/p1/mobile/putong/data/DoublePair;

.field public b:Ll/fmj;

.field public c:Z

.field public d:Lcom/p1/mobile/putong/data/DoublePair;

.field public e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

.field public f:Lcom/p1/mobile/putong/data/DoublePair;

.field public g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/gsl0;->f:Lcom/p1/mobile/putong/data/DoublePair;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic A0(Ll/gsl0;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->X0(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V
    .locals 4

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 18
    .line 19
    iget-object v2, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 20
    .line 21
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 22
    .line 23
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 32
    .line 33
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 34
    .line 35
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/qrl0;

    .line 50
    .line 51
    invoke-direct {v0, p0, p2}, Ll/qrl0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    new-instance p2, Ll/rrl0;

    .line 55
    .line 56
    invoke-direct {p2, p0}, Ll/rrl0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static D0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DoublePair;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    iput-boolean v2, v1, Lcom/p1/mobile/putong/data/DoublePair;->isEmpty:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, v0, v1}, Ll/gsl0;->C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    :cond_0
    if-eqz p0, :cond_2

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 10
    .line 11
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 12
    .line 13
    sub-double/2addr v0, v2

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    sget-wide v2, Ll/gsl0;->h:D

    .line 19
    .line 20
    cmpg-double v0, v0, v2

    .line 21
    .line 22
    if-gez v0, :cond_2

    .line 23
    .line 24
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 25
    .line 26
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 27
    .line 28
    sub-double/2addr v0, p0

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    sget-wide v0, Ll/gsl0;->h:D

    .line 34
    .line 35
    cmpg-double p0, p0, v0

    .line 36
    .line 37
    if-gez p0, :cond_2

    .line 38
    .line 39
    :cond_1
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method private synthetic N0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/gsl0;->b:Ll/fmj;

    .line 11
    .line 12
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/psl0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/psl0;->r()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/qxv;->c()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/xxv;->g(Landroid/app/Activity;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method private synthetic O0(Ll/z80;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/psl0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/z80;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, p1}, Ll/psl0;->B(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic P0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/psl0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/psl0;->C(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/gsl0;->a:Lcom/p1/mobile/putong/data/DoublePair;

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 33
    .line 34
    new-instance v1, Ll/xrl0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/xrl0;-><init>(Ll/gsl0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Ll/gsl0;->D0(Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 55
    .line 56
    iput-object p1, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 57
    .line 58
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 59
    .line 60
    check-cast p0, Ll/psl0;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/psl0;->l(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private synthetic Q0(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_2

    .line 6
    .line 7
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/location/a;->w(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/psl0;

    .line 15
    .line 16
    invoke-static {}, Ll/xxv;->u()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/xxv;->t()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    :cond_0
    move v1, v2

    .line 29
    :cond_1
    invoke-virtual {p0, v1}, Ll/psl0;->z(Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 34
    .line 35
    if-ne p1, v0, :cond_4

    .line 36
    .line 37
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    move v1, v2

    .line 46
    :cond_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "is_location_success"

    .line 51
    .line 52
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    filled-new-array {p0}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "e_vip_history_page_location_info"

    .line 61
    .line 62
    const-string v0, ""

    .line 63
    .line 64
    invoke-static {p1, v0, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_4
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 69
    .line 70
    if-ne p1, v0, :cond_5

    .line 71
    .line 72
    iget-boolean p1, p0, Ll/gsl0;->c:Z

    .line 73
    .line 74
    if-eqz p1, :cond_5

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 81
    .line 82
    iget-object p0, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_5
    return-void
.end method

.method private synthetic R0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/gsl0;->g:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "p_youthvip_page"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/psl0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/psl0;->A()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private synthetic S0(Lcom/p1/mobile/putong/location/Location;)V
    .locals 11

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DoublePair;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/gsl0;->d:Lcom/p1/mobile/putong/data/DoublePair;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 13
    .line 14
    iget-object v0, p0, Ll/gsl0;->d:Lcom/p1/mobile/putong/data/DoublePair;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 21
    .line 22
    iget-object v3, p0, Ll/gsl0;->b:Ll/fmj;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 29
    .line 30
    .line 31
    move-result-wide v5

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 33
    .line 34
    .line 35
    move-result-wide v7

    .line 36
    new-instance v9, Ll/srl0;

    .line 37
    .line 38
    invoke-direct {v9, p0}, Ll/srl0;-><init>(Ll/gsl0;)V

    .line 39
    .line 40
    .line 41
    new-instance v10, Ll/trl0;

    .line 42
    .line 43
    invoke-direct {v10}, Ll/trl0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual/range {v3 .. v10}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Ll/psl0;

    .line 52
    .line 53
    invoke-static {}, Ll/xxv;->u()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    invoke-static {}, Ll/xxv;->t()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 p1, 0x0

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 69
    :goto_1
    invoke-virtual {p0, p1}, Ll/psl0;->z(Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private synthetic U0(Lcom/p1/mobile/putong/location/Location;)V
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

.method private synthetic V0()V
    .locals 2

    .line 1
    const-string v0, "checkPermissionDlg"

    .line 2
    .line 3
    const-string v1, "show in VipLocationHistoryAct"

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
    const/4 v0, 0x1

    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->X1(Lcom/p1/mobile/android/app/Act;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic W0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/psl0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/psl0;->p()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/vrl0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/vrl0;-><init>(Ll/gsl0;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic X0(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gsl0;->a:Lcom/p1/mobile/putong/data/DoublePair;

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

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

.method private Y0(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-interface {p1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 25
    .line 26
    iget-object p2, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-static {p0, v0, p1}, Ll/gsl0;->C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic f0(Ll/gsl0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->N0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic h0(Ll/gsl0;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->S0(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic i0(Ll/gsl0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->R0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j0(Ll/gsl0;Ll/z80;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->O0(Ll/z80;)V

    return-void
.end method

.method public static synthetic k0(Ll/gsl0;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->U0(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic l0()Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/url0;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/url0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/joa;->U3(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic p0(Ll/gsl0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->W0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic q0(Ll/gsl0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->Q0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic r0(Ll/gsl0;Ljava/lang/String;Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gsl0;->J0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V

    return-void
.end method

.method public static synthetic s0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic t0(Ll/gsl0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gsl0;->P0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic u0(Ll/gsl0;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gsl0;->L0(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x0(Ll/gsl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gsl0;->V0()V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic z0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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


# virtual methods
.method public F0(Landroid/content/Intent;)V
    .locals 11

    .line 1
    const-string v0, "map_location"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/DoublePair;

    .line 8
    .line 9
    const-string v1, "map_address"

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 16
    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmpl-double v1, v1, v3

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 24
    .line 25
    cmpl-double v1, v1, v3

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    const-wide v1, 0x3d719799812dea11L    # 1.0E-12

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Ll/gsl0;->d:Lcom/p1/mobile/putong/data/DoublePair;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/gsl0;->E0(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 45
    .line 46
    new-instance v3, Ll/lrl0;

    .line 47
    .line 48
    invoke-direct {v3, v0}, Ll/lrl0;-><init>(Lcom/p1/mobile/putong/data/DoublePair;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Ll/gsl0;->a:Lcom/p1/mobile/putong/data/DoublePair;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ll/gsl0;->D0(Lcom/p1/mobile/android/app/Act;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void

    .line 79
    :cond_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const/4 p1, 0x0

    .line 90
    invoke-static {p0, v2, p1}, Ll/gsl0;->C0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MessageLocation;Ll/x20;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    iget-object v3, p0, Ll/gsl0;->b:Ll/fmj;

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 101
    .line 102
    iget-wide v7, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 103
    .line 104
    new-instance v9, Ll/wrl0;

    .line 105
    .line 106
    invoke-direct {v9, p0, p1, v0}, Ll/wrl0;-><init>(Ll/gsl0;Ljava/lang/String;Lcom/p1/mobile/putong/data/DoublePair;)V

    .line 107
    .line 108
    .line 109
    new-instance v10, Ll/yrl0;

    .line 110
    .line 111
    invoke-direct {v10, p0, v0, p1}, Ll/yrl0;-><init>(Ll/gsl0;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual/range {v3 .. v10}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public G0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsl0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public H0()Lcom/p1/mobile/putong/core/data/RoamedLocationData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsl0;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 2
    .line 3
    return-object p0
.end method

.method public I0()Lcom/p1/mobile/putong/data/DoublePair;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsl0;->a:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic J0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Ll/z80;->b()Ljava/lang/String;

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
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p3}, Ll/z80;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {p3}, Ll/z80;->a()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    :goto_1
    invoke-direct {p0, p2, v0, p1}, Ll/gsl0;->Y0(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 6
    .line 7
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-direct {p0, p1, p3, p2}, Ll/gsl0;->Y0(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "from"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/gsl0;->g:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public a0()V
    .locals 5

    .line 1
    new-instance v0, Ll/zrl0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zrl0;-><init>(Ll/gsl0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/bsl0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/bsl0;-><init>(Ll/gsl0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/xxv;->q()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v1, 0x1

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-wide/16 v2, 0x3

    .line 49
    .line 50
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 51
    .line 52
    invoke-virtual {v0, v2, v3, v4}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v2, Ll/csl0;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Ll/csl0;-><init>(Ll/gsl0;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Ll/dsl0;

    .line 66
    .line 67
    invoke-direct {v3, p0}, Ll/dsl0;-><init>(Ll/gsl0;)V

    .line 68
    .line 69
    .line 70
    const/4 v4, 0x0

    .line 71
    invoke-static {v2, v3, v4}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    :cond_0
    new-instance v0, Ll/esl0;

    .line 79
    .line 80
    invoke-direct {v0}, Ll/esl0;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v2, Ll/fsl0;

    .line 88
    .line 89
    invoke-direct {v2, p0}, Ll/fsl0;-><init>(Ll/gsl0;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v2, Ll/mrl0;

    .line 104
    .line 105
    invoke-direct {v2, p0}, Ll/mrl0;-><init>(Ll/gsl0;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ll/nrl0;

    .line 128
    .line 129
    invoke-direct {v1}, Ll/nrl0;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    new-instance v1, Ll/orl0;

    .line 137
    .line 138
    invoke-direct {v1}, Ll/orl0;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 146
    .line 147
    .line 148
    invoke-static {}, Ll/s7a;->z()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_1

    .line 153
    .line 154
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 157
    .line 158
    const-string v1, "youthVip"

    .line 159
    .line 160
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/prl0;

    .line 169
    .line 170
    invoke-direct {v1}, Ll/prl0;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    new-instance v1, Ll/asl0;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/asl0;-><init>(Ll/gsl0;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 195
    .line 196
    .line 197
    :cond_1
    return-void
.end method

.method public a1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gsl0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
