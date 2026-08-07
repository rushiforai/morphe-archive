.class public Lcom/p1/mobile/putong/location/IntlLocationProvider;
.super Lcom/p1/mobile/putong/location/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/location/IntlLocationProvider$GoogleLocationDialogStatus;
    }
.end annotation


# static fields
.field public static t:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/location/IntlLocationProvider$GoogleLocationDialogStatus;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public n:Lcom/google/android/gms/location/LocationRequest;

.field public o:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field public p:Landroid/os/Looper;

.field public q:Lcom/google/android/gms/location/LocationCallback;

.field public r:Lcom/p1/mobile/putong/location/Location;

.field public s:Landroid/location/LocationListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->t:Lrx/subjects/a;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/location/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/location/IntlLocationProvider;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->F(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/putong/location/IntlLocationProvider;)Lcom/p1/mobile/putong/location/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->r:Lcom/p1/mobile/putong/location/Location;

    return-object p0
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/location/IntlLocationProvider;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->r:Lcom/p1/mobile/putong/location/Location;

    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/location/a;->A(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->o:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/content/Context;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->o:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->n:Lcom/google/android/gms/location/LocationRequest;

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-static {}, Lcom/google/android/gms/location/LocationRequest;->create()Lcom/google/android/gms/location/LocationRequest;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-wide/32 v1, 0x493e0

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-wide/16 v1, 0x1388

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setFastestInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setMaxWaitTime(J)Lcom/google/android/gms/location/LocationRequest;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    const/16 p1, 0x64

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/16 p1, 0x68

    .line 47
    .line 48
    :goto_0
    invoke-virtual {v0, p1}, Lcom/google/android/gms/location/LocationRequest;->setPriority(I)Lcom/google/android/gms/location/LocationRequest;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->n:Lcom/google/android/gms/location/LocationRequest;

    .line 53
    .line 54
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->p:Landroid/os/Looper;

    .line 55
    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    new-instance p1, Landroid/os/HandlerThread;

    .line 59
    .line 60
    const-string v0, "GoogleLocationProvider"

    .line 61
    .line 62
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->p:Landroid/os/Looper;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->q:Lcom/google/android/gms/location/LocationCallback;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    new-instance p1, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;

    .line 79
    .line 80
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/location/IntlLocationProvider$b;-><init>(Lcom/p1/mobile/putong/location/IntlLocationProvider;)V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->q:Lcom/google/android/gms/location/LocationCallback;

    .line 84
    .line 85
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->r()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public B()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->o:Lcom/google/android/gms/location/FusedLocationProviderClient;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->q:Lcom/google/android/gms/location/LocationCallback;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->o:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->q:Lcom/google/android/gms/location/LocationCallback;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Lcom/google/android/gms/location/FusedLocationProviderClient;->removeLocationUpdates(Lcom/google/android/gms/location/LocationCallback;)Lcom/google/android/gms/tasks/Task;

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->s:Landroid/location/LocationListener;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 33
    .line 34
    const-string v1, "location"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/location/LocationManager;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->s:Landroid/location/LocationListener;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final synthetic F(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    const-string p1, "LocationProvider"

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->r:Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "FusedLocationProviderClient requestLocationUpdates succeed provider: %s"

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->y()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->r:Lcom/p1/mobile/putong/location/Location;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string v0, "lastLocation == null,FusedLocationProviderClient requestLocationUpdates failed"

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    new-array v1, v1, [Ljava/lang/Object;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->G()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void

    .line 47
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "lastLocation == null,FusedLocationProviderClient requestLocationUpdates throw exception: %s"

    .line 56
    .line 57
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final G()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->s:Landroid/location/LocationListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/location/IntlLocationProvider$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/location/IntlLocationProvider$a;-><init>(Lcom/p1/mobile/putong/location/IntlLocationProvider;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->s:Landroid/location/LocationListener;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 13
    .line 14
    const-string v1, "location"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    move-object v1, v0

    .line 21
    check-cast v1, Landroid/location/LocationManager;

    .line 22
    .line 23
    :try_start_0
    invoke-virtual {v1}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "gps"

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string v2, "gps"

    .line 36
    .line 37
    iget-object v6, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->s:Landroid/location/LocationListener;

    .line 38
    .line 39
    iget-object v7, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->p:Landroid/os/Looper;

    .line 40
    .line 41
    const-wide/16 v3, 0x1388

    .line 42
    .line 43
    const/high16 v5, 0x41200000    # 10.0f

    .line 44
    .line 45
    invoke-virtual/range {v1 .. v7}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {v1}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v2, "network"

    .line 53
    .line 54
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    const-string v2, "network"

    .line 61
    .line 62
    iget-object v6, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->s:Landroid/location/LocationListener;

    .line 63
    .line 64
    iget-object v7, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->p:Landroid/os/Looper;

    .line 65
    .line 66
    const-wide/16 v3, 0x1388

    .line 67
    .line 68
    const/high16 v5, 0x41200000    # 10.0f

    .line 69
    .line 70
    invoke-virtual/range {v1 .. v7}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void

    .line 74
    :catch_0
    move-exception v0

    .line 75
    move-object p0, v0

    .line 76
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public g()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->r:Lcom/p1/mobile/putong/location/Location;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->o:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->n:Lcom/google/android/gms/location/LocationRequest;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->q:Lcom/google/android/gms/location/LocationCallback;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;->p:Landroid/os/Looper;

    .line 11
    .line 12
    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/location/FusedLocationProviderClient;->requestLocationUpdates(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationCallback;Landroid/os/Looper;)Lcom/google/android/gms/tasks/Task;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/rbo;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/rbo;-><init>(Lcom/p1/mobile/putong/location/IntlLocationProvider;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "intl"

    .line 2
    .line 3
    return-object p0
.end method
