.class public Ll/ubo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/google/android/gms/location/LocationRequest;

.field public c:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field public d:Landroid/os/Looper;

.field public e:Lcom/google/android/gms/location/LocationCallback;

.field public f:Lcom/p1/mobile/putong/location/Location;

.field public g:Landroid/location/LocationListener;

.field public h:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/location/Location;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "IntlLocationUpdateProvider"

    .line 5
    .line 6
    iput-object v0, p0, Ll/ubo;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/ubo;->h:Lrx/subjects/a;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/ubo;Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ubo;->h(Lcom/p1/mobile/putong/location/Location;Z)V

    return-void
.end method

.method public static synthetic b(Ll/ubo;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ubo;->g(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/ubo;)Lcom/p1/mobile/putong/location/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ubo;->f:Lcom/p1/mobile/putong/location/Location;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/ubo;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ubo;->f:Lcom/p1/mobile/putong/location/Location;

    return-void
.end method


# virtual methods
.method public e()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/ubo;->f:Lcom/p1/mobile/putong/location/Location;

    .line 3
    .line 4
    iget-object v0, p0, Ll/ubo;->c:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ubo;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 7
    .line 8
    iget-object v2, p0, Ll/ubo;->e:Lcom/google/android/gms/location/LocationCallback;

    .line 9
    .line 10
    iget-object v3, p0, Ll/ubo;->d:Landroid/os/Looper;

    .line 11
    .line 12
    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/location/FusedLocationProviderClient;->requestLocationUpdates(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationCallback;Landroid/os/Looper;)Lcom/google/android/gms/tasks/Task;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/sbo;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/sbo;-><init>(Ll/ubo;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/location/Location;)Z
    .locals 9

    .line 1
    const/4 p0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmpl-double v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    cmpl-double v0, v0, v2

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 29
    .line 30
    cmpl-double v0, v0, v2

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    cmpl-double v0, v0, v2

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    return p0

    .line 43
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    const-wide/high16 v2, 0x403e000000000000L    # 30.0

    .line 48
    .line 49
    cmpl-double v0, v0, v2

    .line 50
    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    const-wide/high16 v2, 0x405a000000000000L    # 104.0

    .line 58
    .line 59
    cmpl-double v0, v0, v2

    .line 60
    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    return p0

    .line 64
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    const-wide v2, 0x3f689374bc6a7efaL    # 0.003

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    add-double/2addr v0, v2

    .line 74
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    const-wide v2, 0x3f50624de0000000L    # 0.0010000000474974513

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    cmpg-double v0, v0, v2

    .line 84
    .line 85
    const-wide v1, 0x3f847ae140000000L    # 0.009999999776482582

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    const-wide v3, 0x3f847ae147ae147bL    # 0.01

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    if-gtz v0, :cond_4

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    add-double/2addr v5, v3

    .line 102
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    cmpg-double v0, v5, v1

    .line 107
    .line 108
    if-gtz v0, :cond_4

    .line 109
    .line 110
    return p0

    .line 111
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 112
    .line 113
    .line 114
    move-result-wide v5

    .line 115
    const-wide v7, 0x3f661e4f765fd8aeL    # 0.0027

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    add-double/2addr v5, v7

    .line 121
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 122
    .line 123
    .line 124
    move-result-wide v5

    .line 125
    const-wide v7, 0x3f1a36e2e0000000L    # 9.999999747378752E-5

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    cmpg-double v0, v5, v7

    .line 131
    .line 132
    if-gtz v0, :cond_5

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 135
    .line 136
    .line 137
    move-result-wide v5

    .line 138
    add-double/2addr v5, v3

    .line 139
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    cmpg-double p1, v3, v1

    .line 144
    .line 145
    if-gtz p1, :cond_5

    .line 146
    .line 147
    return p0

    .line 148
    :cond_5
    const/4 p0, 0x0

    .line 149
    return p0
.end method

.method public final synthetic g(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    const-string p1, "IntlLocationUpdateProvider"

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Ll/ubo;->f:Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "location update FusedLocationProviderClient requestLocationUpdates succeed provider: %s"

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
    iget-object p0, p0, Ll/ubo;->f:Lcom/p1/mobile/putong/location/Location;

    .line 28
    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    const-string p0, "location update lastLocation == null,FusedLocationProviderClient requestLocationUpdates failed"

    .line 32
    .line 33
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void

    .line 37
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "location update lastLocation == null,FusedLocationProviderClient requestLocationUpdates throw exception: %s"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ubo;->h:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/location/Location;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ubo;->f(Lcom/p1/mobile/putong/location/Location;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    cmpl-double v1, v1, v3

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    cmpl-double v1, v1, v3

    .line 38
    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    cmpl-float v1, v1, v2

    .line 50
    .line 51
    if-nez v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->w()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->w()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eq v0, v1, :cond_1

    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Ll/ubo;->h:Lrx/subjects/a;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    if-eqz p2, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ubo;->n()V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void
.end method

.method public i()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/location/Location;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ubo;->h:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/tbo;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, Ll/tbo;-><init>(Ll/ubo;Lcom/p1/mobile/putong/location/Location;Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 12
    .line 13
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Ll/ubo;->l(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ubo;->e()V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public l(Z)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "VisibleForTests"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ubo;->c:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/content/Context;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/ubo;->c:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/ubo;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    invoke-static {}, Lcom/google/android/gms/location/LocationRequest;->create()Lcom/google/android/gms/location/LocationRequest;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v1, 0x7d0

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0x3e8

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setFastestInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setMaxWaitTime(J)Lcom/google/android/gms/location/LocationRequest;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    const/16 p1, 0x64

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/16 p1, 0x68

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, p1}, Lcom/google/android/gms/location/LocationRequest;->setPriority(I)Lcom/google/android/gms/location/LocationRequest;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/ubo;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 49
    .line 50
    :cond_2
    iget-object p1, p0, Ll/ubo;->d:Landroid/os/Looper;

    .line 51
    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    new-instance p1, Landroid/os/HandlerThread;

    .line 55
    .line 56
    const-string v0, "GoogleLocationUpdateProvider"

    .line 57
    .line 58
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Ll/ubo;->d:Landroid/os/Looper;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Ll/ubo;->e:Lcom/google/android/gms/location/LocationCallback;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    new-instance p1, Ll/ubo$b;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ll/ubo$b;-><init>(Ll/ubo;)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Ll/ubo;->e:Lcom/google/android/gms/location/LocationCallback;

    .line 80
    .line 81
    :cond_4
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ubo;->o()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ubo;->p()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ubo;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
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
    check-cast v0, Landroid/location/LocationManager;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ubo;->c:Lcom/google/android/gms/location/FusedLocationProviderClient;

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
    iget-object v0, p0, Ll/ubo;->e:Lcom/google/android/gms/location/LocationCallback;

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
    iget-object v0, p0, Ll/ubo;->c:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ubo;->e:Lcom/google/android/gms/location/LocationCallback;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Lcom/google/android/gms/location/FusedLocationProviderClient;->removeLocationUpdates(Lcom/google/android/gms/location/LocationCallback;)Lcom/google/android/gms/tasks/Task;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ubo$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ubo$a;-><init>(Ll/ubo;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ubo;->g:Landroid/location/LocationListener;

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
    iget-object v6, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 38
    .line 39
    iget-object v7, p0, Ll/ubo;->d:Landroid/os/Looper;

    .line 40
    .line 41
    const-wide/16 v3, 0x0

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    invoke-virtual/range {v1 .. v7}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {v1}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "network"

    .line 52
    .line 53
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    const-string v2, "network"

    .line 60
    .line 61
    iget-object v6, p0, Ll/ubo;->g:Landroid/location/LocationListener;

    .line 62
    .line 63
    iget-object v7, p0, Ll/ubo;->d:Landroid/os/Looper;

    .line 64
    .line 65
    const-wide/16 v3, 0x0

    .line 66
    .line 67
    const/4 v5, 0x0

    .line 68
    invoke-virtual/range {v1 .. v7}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    move-object p0, v0

    .line 74
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
