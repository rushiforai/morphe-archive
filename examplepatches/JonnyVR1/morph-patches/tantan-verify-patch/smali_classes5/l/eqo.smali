.class public Ll/eqo;
.super Ll/ij2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ij2<",
        "Ll/iqo;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public e:Lcom/p1/mobile/putong/data/User;

.field public f:Lcom/p1/mobile/putong/data/Settings;

.field public g:Ll/fmj;

.field public h:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

.field public i:Lcom/p1/mobile/putong/core/data/AdvancedSettings;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/s1e;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/ij2;-><init>(Ll/s1e;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eqo;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    check-cast p2, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 7
    .line 8
    iput-object p2, p0, Ll/eqo;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A(Ll/eqo;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->M(Ll/z80;)V

    return-void
.end method

.method public static synthetic B(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private H()V
    .locals 2

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
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/bqo;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/bqo;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/cqo;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/cqo;-><init>(Ll/eqo;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/dqo;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/dqo;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/jpo;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/jpo;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/kpo;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/kpo;-><init>(Ll/eqo;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic c(Ll/eqo;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->N(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/User;)Lrx/c;
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
    new-instance v0, Ll/spo;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/spo;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, p0, v0}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/DoublePair;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Ll/eqo;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->L(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic h(Ll/eqo;Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->J(Lcom/p1/mobile/putong/data/DoublePair;)V

    return-void
.end method

.method public static synthetic k(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ll/eqo;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->K(Ll/z80;)V

    return-void
.end method

.method public static synthetic m(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
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

.method public static synthetic o(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic r(Ljava/lang/Throwable;)V
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

.method public static synthetic s(Ll/eqo;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->P(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    return-void
.end method

.method public static synthetic t(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic v(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->h3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic x(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

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

.method public static synthetic z(Ll/eqo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eqo;->O(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public D()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eqo;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E()Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eqo;->i:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/eqo;->h:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Ll/ij2;->a:Ll/iam;

    .line 11
    .line 12
    check-cast v1, Ll/iqo;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/iqo;->q(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/eqo;->i:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 18
    .line 19
    iget-object p0, p0, Ll/eqo;->h:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->subtract(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public F()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eqo;->e:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 33
    .line 34
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 38
    .line 39
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 48
    .line 49
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 56
    .line 57
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 58
    .line 59
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 66
    .line 67
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 68
    .line 69
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 76
    .line 77
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 78
    .line 79
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 80
    .line 81
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 86
    .line 87
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 88
    .line 89
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 96
    .line 97
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 98
    .line 99
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 106
    .line 107
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 108
    .line 109
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 116
    .line 117
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 118
    .line 119
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 120
    .line 121
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 126
    .line 127
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 128
    .line 129
    iget-object v2, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 136
    .line 137
    iget-object p0, p0, Ll/eqo;->e:Lcom/p1/mobile/putong/data/User;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :cond_0
    const/4 p0, 0x0

    .line 151
    return-object p0
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eqo;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/eqo;->g:Ll/fmj;

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/eqo;->G()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/eqo;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/ipo;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ipo;-><init>(Ll/eqo;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/tpo;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/tpo;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/wpo;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/wpo;-><init>(Ll/eqo;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/dx6;->s3()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/xpo;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/xpo;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/ypo;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/ypo;-><init>(Ll/eqo;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const/4 v0, 0x1

    .line 97
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    new-instance v0, Ll/zpo;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/zpo;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    new-instance v0, Ll/aqo;

    .line 115
    .line 116
    invoke-direct {v0}, Ll/aqo;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 11

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/ij2;->a:Ll/iam;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    check-cast v1, Ll/iqo;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->m3:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/z90;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/z90;->b()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    :goto_0
    invoke-virtual {v1, p1, p0}, Ll/iqo;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    check-cast v1, Ll/iqo;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->n3:I

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ll/z90;->b()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    goto :goto_1

    .line 99
    :cond_2
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ll/z90;->b()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    :goto_1
    invoke-virtual {v1, v0, v2}, Ll/iqo;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v3, p0, Ll/eqo;->g:Ll/fmj;

    .line 111
    .line 112
    iget-object v4, p0, Ll/eqo;->c:Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 115
    .line 116
    iget-wide v7, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 117
    .line 118
    new-instance v9, Ll/qpo;

    .line 119
    .line 120
    invoke-direct {v9, p0}, Ll/qpo;-><init>(Ll/eqo;)V

    .line 121
    .line 122
    .line 123
    new-instance v10, Ll/rpo;

    .line 124
    .line 125
    invoke-direct {v10}, Ll/rpo;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual/range {v3 .. v10}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final synthetic K(Ll/z80;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/z90;->d(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/iqo;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-virtual {v0, p0}, Ll/iqo;->u(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/location/Location;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Ll/eqo;->g:Ll/fmj;

    .line 40
    .line 41
    iget-object v2, p0, Ll/eqo;->c:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 44
    .line 45
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 46
    .line 47
    new-instance v7, Ll/upo;

    .line 48
    .line 49
    invoke-direct {v7, p0}, Ll/upo;-><init>(Ll/eqo;)V

    .line 50
    .line 51
    .line 52
    new-instance v8, Ll/vpo;

    .line 53
    .line 54
    invoke-direct {v8}, Ll/vpo;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual/range {v1 .. v8}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final synthetic M(Ll/z80;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/z90;->d(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/iqo;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-virtual {v0, p0}, Ll/iqo;->u(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/iqo;

    .line 8
    .line 9
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Ll/iqo;->s(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/eqo;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/iqo;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/iqo;->k(Lcom/p1/mobile/putong/data/Settings;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ll/eqo;->H()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 27
    .line 28
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 29
    .line 30
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts()Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 65
    .line 66
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 81
    .line 82
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 89
    .line 90
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->showMomentLikes()Ljava/lang/Boolean;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 97
    .line 98
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 105
    .line 106
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 113
    .line 114
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 121
    .line 122
    new-instance v1, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 128
    .line 129
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 132
    .line 133
    const/4 v1, 0x0

    .line 134
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 143
    .line 144
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 151
    .line 152
    .line 153
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 154
    .line 155
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 156
    .line 157
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_1

    .line 168
    .line 169
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 176
    .line 177
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IntlMoreGender;->clone()Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 188
    .line 189
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 190
    .line 191
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 198
    .line 199
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 204
    .line 205
    iget-object p1, p0, Ll/ij2;->a:Ll/iam;

    .line 206
    .line 207
    check-cast p1, Ll/iqo;

    .line 208
    .line 209
    iget-object p0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 210
    .line 211
    invoke-virtual {p1, p0}, Ll/iqo;->i(Lcom/p1/mobile/putong/data/Settings;)V

    .line 212
    .line 213
    .line 214
    :cond_1
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/eqo;->h:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/eqo;->i:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/iqo;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/iqo;->j(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eqo;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/eqo;->R()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eqo;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/eqo;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/eqo;->F()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/eqo;->E()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l8(Lcom/p1/mobile/putong/data/SettingGroups;Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/lpo;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/lpo;-><init>(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance v0, Ll/mpo;

    .line 63
    .line 64
    invoke-direct {v0}, Ll/mpo;-><init>()V

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/npo;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/npo;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-virtual {v0, p0, v1}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    new-instance v0, Ll/opo;

    .line 96
    .line 97
    invoke-direct {v0}, Ll/opo;-><init>()V

    .line 98
    .line 99
    .line 100
    new-instance v1, Ll/ppo;

    .line 101
    .line 102
    invoke-direct {v1}, Ll/ppo;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    :cond_1
    return-void
.end method
