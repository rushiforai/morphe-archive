.class public final Lcom/google/android/gms/measurement/internal/c;
.super Ll/kix0;
.source "SourceFile"


# instance fields
.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:Ljava/lang/String;

.field public g:J

.field public h:J

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/lang/String;

.field public k:I

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:J

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/atx0;J)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/kix0;-><init>(Ll/atx0;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/c;->o:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/c;->p:Ljava/lang/String;

    .line 10
    .line 11
    iput-wide p2, p0, Lcom/google/android/gms/measurement/internal/c;->h:J

    .line 12
    .line 13
    return-void
.end method

.method private final D()Ljava/lang/String;
    .locals 4
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-static {}, Ll/oqy0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v2, Ll/whs0;->s0:Ll/zpw0;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "Disabled IID for tests."

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v2, "com.google.firebase.analytics.FirebaseAnalytics"

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_1
    :try_start_1
    const-string v2, "getInstance"

    .line 52
    .line 53
    const-class v3, Landroid/content/Context;

    .line 54
    .line 55
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 75
    if-nez v2, :cond_2

    .line 76
    .line 77
    return-object v1

    .line 78
    :cond_2
    :try_start_2
    const-string v3, "getFirebaseInstanceId"

    .line 79
    .line 80
    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 89
    .line 90
    return-object v0

    .line 91
    :catch_0
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/d6x0;->G()Ll/l8x0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string v0, "Failed to retrieve Firebase Instance Id"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-object v1

    .line 105
    :catch_1
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/d6x0;->H()Ll/l8x0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string v0, "Failed to obtain Firebase Analytics instance"

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :catch_2
    return-object v1
.end method


# virtual methods
.method public final A()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->l:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/c;->l:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public final B()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/c;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C()V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzje$zza;->zzb:Lcom/google/android/gms/measurement/internal/zzje$zza;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzje;->m(Lcom/google/android/gms/measurement/internal/zzje$zza;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Analytics Storage consent is not granted"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 v0, 0x10

    .line 36
    .line 37
    new-array v0, v0, [B

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/hny0;->Q0()Ljava/security/SecureRandom;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 48
    .line 49
    .line 50
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 51
    .line 52
    new-instance v2, Ljava/math/BigInteger;

    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    invoke-direct {v2, v3, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 56
    .line 57
    .line 58
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v2, "%032x"

    .line 63
    .line 64
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    :goto_0
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Ll/d6x0;->z()Ll/l8x0;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    const-string v2, "null"

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    const-string v2, "not null"

    .line 82
    .line 83
    :goto_1
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v3, "Resetting session stitching token to %s"

    .line 88
    .line 89
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->n:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/c;->o:J

    .line 107
    .line 108
    return-void
.end method

.method public final E(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->p:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/c;->p:Ljava/lang/String;

    .line 15
    .line 16
    return v0
.end method

.method public final bridge synthetic a()Ll/ajr0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic b()Ll/o7s0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->b()Ll/o7s0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic c()Ll/wxw0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->c()Ll/wxw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic d()Ll/ajx0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic e()Ll/hny0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic g()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic h()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic i()Ll/n9s0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->i()Ll/n9s0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic j()Lcom/google/android/gms/measurement/internal/c;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic k()Ll/zvw0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic l()Lcom/google/android/gms/measurement/internal/g;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic m()Ll/say0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->m()Ll/say0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic n()Ll/hcy0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic o()Ll/thy0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->o()Ll/thy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final s()V
    .locals 11
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "appId",
            "appStore",
            "appName",
            "gmpAppId",
            "gaAppId"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x0

    .line 18
    const-string v3, ""

    .line 19
    .line 20
    const-string v4, "unknown"

    .line 21
    .line 22
    const-string v5, "Unknown"

    .line 23
    .line 24
    const/high16 v6, -0x80000000

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    invoke-virtual {v7}, Ll/d6x0;->A()Ll/l8x0;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    const-string v8, "PackageManager is null, app identity information might be inaccurate. appId"

    .line 37
    .line 38
    invoke-static {v0}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v9

    .line 42
    invoke-virtual {v7, v8, v9}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    goto :goto_4

    .line 46
    :cond_0
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    goto :goto_0

    .line 51
    :catch_0
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v7}, Ll/d6x0;->A()Ll/l8x0;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const-string v8, "Error retrieving app installer package name. appId"

    .line 60
    .line 61
    invoke-static {v0}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    invoke-virtual {v7, v8, v9}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    if-nez v4, :cond_1

    .line 69
    .line 70
    const-string v4, "manual_install"

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    const-string v7, "com.android.vending"

    .line 74
    .line 75
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    if-eqz v7, :cond_2

    .line 80
    .line 81
    move-object v4, v3

    .line 82
    :cond_2
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    invoke-virtual {v1, v7, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    if-eqz v7, :cond_4

    .line 95
    .line 96
    iget-object v8, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 97
    .line 98
    invoke-virtual {v1, v8}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    if-nez v9, :cond_3

    .line 107
    .line 108
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v8
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 112
    goto :goto_2

    .line 113
    :cond_3
    move-object v8, v5

    .line 114
    :goto_2
    :try_start_2
    iget-object v5, v7, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 115
    .line 116
    iget v6, v7, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 117
    .line 118
    goto :goto_4

    .line 119
    :catch_1
    move-object v7, v5

    .line 120
    move-object v5, v8

    .line 121
    goto :goto_3

    .line 122
    :catch_2
    move-object v7, v5

    .line 123
    :goto_3
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    invoke-virtual {v8}, Ll/d6x0;->A()Ll/l8x0;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    const-string v9, "Error retrieving package info. appId, appName"

    .line 132
    .line 133
    invoke-static {v0}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v10

    .line 137
    invoke-virtual {v8, v9, v10, v5}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    move-object v5, v7

    .line 141
    :cond_4
    :goto_4
    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->c:Ljava/lang/String;

    .line 142
    .line 143
    iput-object v4, p0, Lcom/google/android/gms/measurement/internal/c;->f:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v5, p0, Lcom/google/android/gms/measurement/internal/c;->d:Ljava/lang/String;

    .line 146
    .line 147
    iput v6, p0, Lcom/google/android/gms/measurement/internal/c;->e:I

    .line 148
    .line 149
    const-wide/16 v4, 0x0

    .line 150
    .line 151
    iput-wide v4, p0, Lcom/google/android/gms/measurement/internal/c;->g:J

    .line 152
    .line 153
    iget-object v4, p0, Ll/yyx0;->a:Ll/atx0;

    .line 154
    .line 155
    invoke-virtual {v4}, Ll/atx0;->H()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    const/4 v5, 0x1

    .line 164
    if-nez v4, :cond_5

    .line 165
    .line 166
    iget-object v4, p0, Ll/yyx0;->a:Ll/atx0;

    .line 167
    .line 168
    invoke-virtual {v4}, Ll/atx0;->I()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    const-string v6, "am"

    .line 173
    .line 174
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-eqz v4, :cond_5

    .line 179
    .line 180
    move v4, v5

    .line 181
    goto :goto_5

    .line 182
    :cond_5
    move v4, v2

    .line 183
    :goto_5
    iget-object v6, p0, Ll/yyx0;->a:Ll/atx0;

    .line 184
    .line 185
    invoke-virtual {v6}, Ll/atx0;->s()I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    packed-switch v6, :pswitch_data_0

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 193
    .line 194
    .line 195
    move-result-object v7

    .line 196
    invoke-virtual {v7}, Ll/d6x0;->D()Ll/l8x0;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    const-string v8, "App measurement disabled"

    .line 201
    .line 202
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 206
    .line 207
    .line 208
    move-result-object v7

    .line 209
    invoke-virtual {v7}, Ll/d6x0;->C()Ll/l8x0;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    const-string v8, "Invalid scion state in identity"

    .line 214
    .line 215
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_6

    .line 219
    .line 220
    :pswitch_0
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 221
    .line 222
    .line 223
    move-result-object v7

    .line 224
    invoke-virtual {v7}, Ll/d6x0;->D()Ll/l8x0;

    .line 225
    .line 226
    .line 227
    move-result-object v7

    .line 228
    const-string v8, "App measurement disabled due to denied storage consent"

    .line 229
    .line 230
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_6

    .line 234
    .line 235
    :pswitch_1
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    invoke-virtual {v7}, Ll/d6x0;->D()Ll/l8x0;

    .line 240
    .line 241
    .line 242
    move-result-object v7

    .line 243
    const-string v8, "App measurement disabled via the global data collection setting"

    .line 244
    .line 245
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    goto :goto_6

    .line 249
    :pswitch_2
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 250
    .line 251
    .line 252
    move-result-object v7

    .line 253
    invoke-virtual {v7}, Ll/d6x0;->G()Ll/l8x0;

    .line 254
    .line 255
    .line 256
    move-result-object v7

    .line 257
    const-string v8, "App measurement deactivated via resources. This method is being deprecated. Please refer to https://firebase.google.com/support/guides/disable-analytics"

    .line 258
    .line 259
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    goto :goto_6

    .line 263
    :pswitch_3
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 264
    .line 265
    .line 266
    move-result-object v7

    .line 267
    invoke-virtual {v7}, Ll/d6x0;->E()Ll/l8x0;

    .line 268
    .line 269
    .line 270
    move-result-object v7

    .line 271
    const-string v8, "App measurement disabled via the init parameters"

    .line 272
    .line 273
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    goto :goto_6

    .line 277
    :pswitch_4
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 278
    .line 279
    .line 280
    move-result-object v7

    .line 281
    invoke-virtual {v7}, Ll/d6x0;->D()Ll/l8x0;

    .line 282
    .line 283
    .line 284
    move-result-object v7

    .line 285
    const-string v8, "App measurement disabled via the manifest"

    .line 286
    .line 287
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    goto :goto_6

    .line 291
    :pswitch_5
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 292
    .line 293
    .line 294
    move-result-object v7

    .line 295
    invoke-virtual {v7}, Ll/d6x0;->D()Ll/l8x0;

    .line 296
    .line 297
    .line 298
    move-result-object v7

    .line 299
    const-string v8, "App measurement disabled by setAnalyticsCollectionEnabled(false)"

    .line 300
    .line 301
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    goto :goto_6

    .line 305
    :pswitch_6
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 306
    .line 307
    .line 308
    move-result-object v7

    .line 309
    invoke-virtual {v7}, Ll/d6x0;->E()Ll/l8x0;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    const-string v8, "App measurement deactivated via the init parameters"

    .line 314
    .line 315
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    goto :goto_6

    .line 319
    :pswitch_7
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 320
    .line 321
    .line 322
    move-result-object v7

    .line 323
    invoke-virtual {v7}, Ll/d6x0;->D()Ll/l8x0;

    .line 324
    .line 325
    .line 326
    move-result-object v7

    .line 327
    const-string v8, "App measurement deactivated via the manifest"

    .line 328
    .line 329
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    goto :goto_6

    .line 333
    :pswitch_8
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 334
    .line 335
    .line 336
    move-result-object v7

    .line 337
    invoke-virtual {v7}, Ll/d6x0;->E()Ll/l8x0;

    .line 338
    .line 339
    .line 340
    move-result-object v7

    .line 341
    const-string v8, "App measurement collection enabled"

    .line 342
    .line 343
    invoke-virtual {v7, v8}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    :goto_6
    if-nez v6, :cond_6

    .line 347
    .line 348
    goto :goto_7

    .line 349
    :cond_6
    move v5, v2

    .line 350
    :goto_7
    iput-object v3, p0, Lcom/google/android/gms/measurement/internal/c;->l:Ljava/lang/String;

    .line 351
    .line 352
    iput-object v3, p0, Lcom/google/android/gms/measurement/internal/c;->m:Ljava/lang/String;

    .line 353
    .line 354
    if-eqz v4, :cond_7

    .line 355
    .line 356
    iget-object v4, p0, Ll/yyx0;->a:Ll/atx0;

    .line 357
    .line 358
    invoke-virtual {v4}, Ll/atx0;->H()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    iput-object v4, p0, Lcom/google/android/gms/measurement/internal/c;->m:Ljava/lang/String;

    .line 363
    .line 364
    :cond_7
    :try_start_3
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 365
    .line 366
    .line 367
    move-result-object v4

    .line 368
    iget-object v6, p0, Ll/yyx0;->a:Ll/atx0;

    .line 369
    .line 370
    invoke-virtual {v6}, Ll/atx0;->K()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v6

    .line 374
    const-string v7, "google_app_id"

    .line 375
    .line 376
    new-instance v8, Ll/dsx0;

    .line 377
    .line 378
    invoke-direct {v8, v4, v6}, Ll/dsx0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v8, v7}, Ll/dsx0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v4

    .line 385
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 386
    .line 387
    .line 388
    move-result v6

    .line 389
    if-eqz v6, :cond_8

    .line 390
    .line 391
    goto :goto_8

    .line 392
    :cond_8
    move-object v3, v4

    .line 393
    :goto_8
    iput-object v3, p0, Lcom/google/android/gms/measurement/internal/c;->l:Ljava/lang/String;

    .line 394
    .line 395
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    if-nez v3, :cond_9

    .line 400
    .line 401
    new-instance v3, Ll/dsx0;

    .line 402
    .line 403
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 404
    .line 405
    .line 406
    move-result-object v4

    .line 407
    iget-object v6, p0, Ll/yyx0;->a:Ll/atx0;

    .line 408
    .line 409
    invoke-virtual {v6}, Ll/atx0;->K()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v6

    .line 413
    invoke-direct {v3, v4, v6}, Ll/dsx0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    const-string v4, "admob_app_id"

    .line 417
    .line 418
    invoke-virtual {v3, v4}, Ll/dsx0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    iput-object v3, p0, Lcom/google/android/gms/measurement/internal/c;->m:Ljava/lang/String;

    .line 423
    .line 424
    goto :goto_9

    .line 425
    :catch_3
    move-exception v3

    .line 426
    goto :goto_b

    .line 427
    :cond_9
    :goto_9
    if-eqz v5, :cond_b

    .line 428
    .line 429
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 430
    .line 431
    .line 432
    move-result-object v3

    .line 433
    invoke-virtual {v3}, Ll/d6x0;->E()Ll/l8x0;

    .line 434
    .line 435
    .line 436
    move-result-object v3

    .line 437
    const-string v4, "App measurement enabled for app package, google app id"

    .line 438
    .line 439
    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/c;->c:Ljava/lang/String;

    .line 440
    .line 441
    iget-object v6, p0, Lcom/google/android/gms/measurement/internal/c;->l:Ljava/lang/String;

    .line 442
    .line 443
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 444
    .line 445
    .line 446
    move-result v6

    .line 447
    if-eqz v6, :cond_a

    .line 448
    .line 449
    iget-object v6, p0, Lcom/google/android/gms/measurement/internal/c;->m:Ljava/lang/String;

    .line 450
    .line 451
    goto :goto_a

    .line 452
    :cond_a
    iget-object v6, p0, Lcom/google/android/gms/measurement/internal/c;->l:Ljava/lang/String;

    .line 453
    .line 454
    :goto_a
    invoke-virtual {v3, v4, v5, v6}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_3

    .line 455
    .line 456
    .line 457
    goto :goto_c

    .line 458
    :goto_b
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    invoke-virtual {v4}, Ll/d6x0;->A()Ll/l8x0;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    const-string v5, "Fetching Google App Id failed with exception. appId"

    .line 467
    .line 468
    invoke-static {v0}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    invoke-virtual {v4, v5, v0, v3}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 473
    .line 474
    .line 475
    :cond_b
    :goto_c
    const/4 v0, 0x0

    .line 476
    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->i:Ljava/util/List;

    .line 477
    .line 478
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 479
    .line 480
    .line 481
    move-result-object v0

    .line 482
    const-string v3, "analytics.safelisted_events"

    .line 483
    .line 484
    invoke-virtual {v0, v3}, Ll/ajr0;->D(Ljava/lang/String;)Ljava/util/List;

    .line 485
    .line 486
    .line 487
    move-result-object v0

    .line 488
    if-eqz v0, :cond_e

    .line 489
    .line 490
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 491
    .line 492
    .line 493
    move-result v3

    .line 494
    if-eqz v3, :cond_c

    .line 495
    .line 496
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    invoke-virtual {v0}, Ll/d6x0;->G()Ll/l8x0;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    const-string v3, "Safelisted event list is empty. Ignoring"

    .line 505
    .line 506
    invoke-virtual {v0, v3}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 507
    .line 508
    .line 509
    goto :goto_d

    .line 510
    :cond_c
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 511
    .line 512
    .line 513
    move-result-object v3

    .line 514
    :cond_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 515
    .line 516
    .line 517
    move-result v4

    .line 518
    if-eqz v4, :cond_e

    .line 519
    .line 520
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    move-result-object v4

    .line 524
    check-cast v4, Ljava/lang/String;

    .line 525
    .line 526
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 527
    .line 528
    .line 529
    move-result-object v5

    .line 530
    const-string v6, "safelisted event"

    .line 531
    .line 532
    invoke-virtual {v5, v6, v4}, Ll/hny0;->q0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 533
    .line 534
    .line 535
    move-result v4

    .line 536
    if-nez v4, :cond_d

    .line 537
    .line 538
    goto :goto_d

    .line 539
    :cond_e
    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->i:Ljava/util/List;

    .line 540
    .line 541
    :goto_d
    if-eqz v1, :cond_f

    .line 542
    .line 543
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 544
    .line 545
    .line 546
    move-result-object v0

    .line 547
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/InstantApps;->isInstantApp(Landroid/content/Context;)Z

    .line 548
    .line 549
    .line 550
    move-result v0

    .line 551
    iput v0, p0, Lcom/google/android/gms/measurement/internal/c;->k:I

    .line 552
    .line 553
    return-void

    .line 554
    :cond_f
    iput v2, p0, Lcom/google/android/gms/measurement/internal/c;->k:I

    .line 555
    .line 556
    return-void

    .line 557
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final u()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final v(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzo;
    .locals 41
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzo;

    .line 7
    .line 8
    move-object v2, v1

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->z()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    move-object v3, v2

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->A()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0}, Ll/kix0;->p()V

    .line 19
    .line 20
    .line 21
    move-object v4, v3

    .line 22
    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/c;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->x()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    int-to-long v5, v5

    .line 29
    invoke-virtual {v0}, Ll/kix0;->p()V

    .line 30
    .line 31
    .line 32
    iget-object v7, v0, Lcom/google/android/gms/measurement/internal/c;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v7}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-object v7, v4

    .line 38
    move-wide v4, v5

    .line 39
    iget-object v6, v0, Lcom/google/android/gms/measurement/internal/c;->f:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/kix0;->p()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 45
    .line 46
    .line 47
    iget-wide v8, v0, Lcom/google/android/gms/measurement/internal/c;->g:J

    .line 48
    .line 49
    const-wide/16 v10, 0x0

    .line 50
    .line 51
    cmp-long v8, v8, v10

    .line 52
    .line 53
    if-nez v8, :cond_0

    .line 54
    .line 55
    iget-object v8, v0, Ll/yyx0;->a:Ll/atx0;

    .line 56
    .line 57
    invoke-virtual {v8}, Ll/atx0;->G()Ll/hny0;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    invoke-virtual {v0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    invoke-virtual {v0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v12

    .line 69
    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v12

    .line 73
    invoke-virtual {v8, v9, v12}, Ll/hny0;->t(Landroid/content/Context;Ljava/lang/String;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v8

    .line 77
    iput-wide v8, v0, Lcom/google/android/gms/measurement/internal/c;->g:J

    .line 78
    .line 79
    :cond_0
    move-wide v11, v10

    .line 80
    iget-wide v9, v0, Lcom/google/android/gms/measurement/internal/c;->g:J

    .line 81
    .line 82
    iget-object v8, v0, Ll/yyx0;->a:Ll/atx0;

    .line 83
    .line 84
    invoke-virtual {v8}, Ll/atx0;->k()Z

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 89
    .line 90
    .line 91
    move-result-object v13

    .line 92
    iget-boolean v13, v13, Ll/ajx0;->t:Z

    .line 93
    .line 94
    const/4 v14, 0x1

    .line 95
    xor-int/2addr v13, v14

    .line 96
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 97
    .line 98
    .line 99
    iget-object v15, v0, Ll/yyx0;->a:Ll/atx0;

    .line 100
    .line 101
    invoke-virtual {v15}, Ll/atx0;->k()Z

    .line 102
    .line 103
    .line 104
    move-result v15

    .line 105
    const/16 v16, 0x0

    .line 106
    .line 107
    if-nez v15, :cond_1

    .line 108
    .line 109
    move-object/from16 v15, v16

    .line 110
    .line 111
    :goto_0
    move-wide/from16 v17, v11

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    invoke-direct {v0}, Lcom/google/android/gms/measurement/internal/c;->D()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v15

    .line 118
    goto :goto_0

    .line 119
    :goto_1
    iget-object v11, v0, Ll/yyx0;->a:Ll/atx0;

    .line 120
    .line 121
    invoke-virtual {v11}, Ll/atx0;->A()Ll/ajx0;

    .line 122
    .line 123
    .line 124
    move-result-object v12

    .line 125
    iget-object v12, v12, Ll/ajx0;->g:Ll/zjx0;

    .line 126
    .line 127
    move/from16 v19, v14

    .line 128
    .line 129
    move-object/from16 v20, v15

    .line 130
    .line 131
    invoke-virtual {v12}, Ll/zjx0;->a()J

    .line 132
    .line 133
    .line 134
    move-result-wide v14

    .line 135
    cmp-long v12, v14, v17

    .line 136
    .line 137
    move-object/from16 v21, v1

    .line 138
    .line 139
    move-object/from16 v22, v2

    .line 140
    .line 141
    iget-wide v1, v11, Ll/atx0;->H:J

    .line 142
    .line 143
    if-nez v12, :cond_2

    .line 144
    .line 145
    :goto_2
    move/from16 v11, v19

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_2
    invoke-static {v1, v2, v14, v15}, Ljava/lang/Math;->min(JJ)J

    .line 149
    .line 150
    .line 151
    move-result-wide v1

    .line 152
    goto :goto_2

    .line 153
    :goto_3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->w()I

    .line 154
    .line 155
    .line 156
    move-result v19

    .line 157
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 158
    .line 159
    .line 160
    move-result-object v12

    .line 161
    invoke-virtual {v12}, Ll/ajr0;->O()Z

    .line 162
    .line 163
    .line 164
    move-result v12

    .line 165
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 166
    .line 167
    .line 168
    move-result-object v14

    .line 169
    invoke-virtual {v14}, Ll/yyx0;->h()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v14}, Ll/ajx0;->D()Landroid/content/SharedPreferences;

    .line 173
    .line 174
    .line 175
    move-result-object v14

    .line 176
    const-string v15, "deferred_analytics_collection"

    .line 177
    .line 178
    move/from16 v23, v11

    .line 179
    .line 180
    const/4 v11, 0x0

    .line 181
    invoke-interface {v14, v15, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 182
    .line 183
    .line 184
    move-result v14

    .line 185
    move-wide/from16 v24, v17

    .line 186
    .line 187
    move-wide/from16 v17, v1

    .line 188
    .line 189
    move-object/from16 v2, v22

    .line 190
    .line 191
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->y()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v22

    .line 195
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    const-string v15, "google_analytics_default_allow_ad_personalization_signals"

    .line 200
    .line 201
    invoke-virtual {v1, v15}, Ll/ajr0;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    if-nez v1, :cond_3

    .line 206
    .line 207
    move-object/from16 v1, v16

    .line 208
    .line 209
    :goto_4
    move/from16 v26, v12

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    xor-int/lit8 v1, v1, 0x1

    .line 217
    .line 218
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    goto :goto_4

    .line 223
    :goto_5
    iget-wide v11, v0, Lcom/google/android/gms/measurement/internal/c;->h:J

    .line 224
    .line 225
    move-object/from16 v28, v1

    .line 226
    .line 227
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->i:Ljava/util/List;

    .line 228
    .line 229
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 230
    .line 231
    .line 232
    move-result-object v29

    .line 233
    invoke-virtual/range {v29 .. v29}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 234
    .line 235
    .line 236
    move-result-object v29

    .line 237
    invoke-virtual/range {v29 .. v29}, Lcom/google/android/gms/measurement/internal/zzje;->x()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v29

    .line 241
    move-object/from16 v30, v1

    .line 242
    .line 243
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->j:Ljava/lang/String;

    .line 244
    .line 245
    if-nez v1, :cond_4

    .line 246
    .line 247
    invoke-virtual {v0}, Ll/yyx0;->e()Ll/hny0;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v1}, Ll/hny0;->O0()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iput-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->j:Ljava/lang/String;

    .line 256
    .line 257
    :cond_4
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->j:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {}, Ll/ziy0;->a()Z

    .line 260
    .line 261
    .line 262
    move-result v31

    .line 263
    if-eqz v31, :cond_5

    .line 264
    .line 265
    move-object/from16 v31, v1

    .line 266
    .line 267
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    move-object/from16 v32, v2

    .line 272
    .line 273
    sget-object v2, Ll/whs0;->Y0:Ll/zpw0;

    .line 274
    .line 275
    invoke-virtual {v1, v2}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    if-eqz v1, :cond_6

    .line 280
    .line 281
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-virtual {v1}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    sget-object v2, Lcom/google/android/gms/measurement/internal/zzje$zza;->zzb:Lcom/google/android/gms/measurement/internal/zzje$zza;

    .line 290
    .line 291
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzje;->m(Lcom/google/android/gms/measurement/internal/zzje$zza;)Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-nez v1, :cond_6

    .line 296
    .line 297
    goto :goto_6

    .line 298
    :cond_5
    move-object/from16 v31, v1

    .line 299
    .line 300
    move-object/from16 v32, v2

    .line 301
    .line 302
    :cond_6
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 303
    .line 304
    .line 305
    iget-wide v1, v0, Lcom/google/android/gms/measurement/internal/c;->o:J

    .line 306
    .line 307
    cmp-long v1, v1, v24

    .line 308
    .line 309
    if-eqz v1, :cond_7

    .line 310
    .line 311
    invoke-virtual {v0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 316
    .line 317
    .line 318
    move-result-wide v1

    .line 319
    move-wide/from16 v33, v1

    .line 320
    .line 321
    iget-wide v1, v0, Lcom/google/android/gms/measurement/internal/c;->o:J

    .line 322
    .line 323
    sub-long v1, v33, v1

    .line 324
    .line 325
    move-wide/from16 v33, v1

    .line 326
    .line 327
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->n:Ljava/lang/String;

    .line 328
    .line 329
    if-eqz v1, :cond_7

    .line 330
    .line 331
    const-wide/32 v1, 0x5265c00

    .line 332
    .line 333
    .line 334
    cmp-long v1, v33, v1

    .line 335
    .line 336
    if-lez v1, :cond_7

    .line 337
    .line 338
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->p:Ljava/lang/String;

    .line 339
    .line 340
    if-nez v1, :cond_7

    .line 341
    .line 342
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->C()V

    .line 343
    .line 344
    .line 345
    :cond_7
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->n:Ljava/lang/String;

    .line 346
    .line 347
    if-nez v1, :cond_8

    .line 348
    .line 349
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->C()V

    .line 350
    .line 351
    .line 352
    :cond_8
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/c;->n:Ljava/lang/String;

    .line 353
    .line 354
    move-object/from16 v16, v1

    .line 355
    .line 356
    :goto_6
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    const-string v2, "google_analytics_sgtm_upload_enabled"

    .line 361
    .line 362
    invoke-virtual {v1, v2}, Ll/ajr0;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    if-nez v1, :cond_9

    .line 367
    .line 368
    const/4 v1, 0x0

    .line 369
    goto :goto_7

    .line 370
    :cond_9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    :goto_7
    invoke-virtual {v0}, Ll/yyx0;->e()Ll/hny0;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/measurement/internal/c;->z()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-virtual {v2, v0}, Ll/hny0;->t0(Ljava/lang/String;)J

    .line 383
    .line 384
    .line 385
    move-result-wide v33

    .line 386
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {v0}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzje;->b()I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 399
    .line 400
    .line 401
    move-result-object v2

    .line 402
    invoke-virtual {v2}, Ll/ajx0;->F()Lcom/google/android/gms/measurement/internal/b;

    .line 403
    .line 404
    .line 405
    move-result-object v2

    .line 406
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/b;->j()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v35

    .line 410
    invoke-static {}, Ll/spy0;->a()Z

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    if-eqz v2, :cond_a

    .line 415
    .line 416
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    move/from16 v36, v0

    .line 421
    .line 422
    sget-object v0, Ll/whs0;->J0:Ll/zpw0;

    .line 423
    .line 424
    invoke-virtual {v2, v0}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 425
    .line 426
    .line 427
    move-result v0

    .line 428
    if-eqz v0, :cond_b

    .line 429
    .line 430
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->e()Ll/hny0;

    .line 431
    .line 432
    .line 433
    invoke-static {}, Ll/hny0;->s0()I

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    goto :goto_8

    .line 438
    :cond_a
    move/from16 v36, v0

    .line 439
    .line 440
    :cond_b
    const/4 v0, 0x0

    .line 441
    :goto_8
    invoke-static {}, Ll/spy0;->a()Z

    .line 442
    .line 443
    .line 444
    move-result v2

    .line 445
    if-eqz v2, :cond_d

    .line 446
    .line 447
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 448
    .line 449
    .line 450
    move-result-object v2

    .line 451
    move/from16 v27, v0

    .line 452
    .line 453
    sget-object v0, Ll/whs0;->J0:Ll/zpw0;

    .line 454
    .line 455
    invoke-virtual {v2, v0}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 456
    .line 457
    .line 458
    move-result v0

    .line 459
    if-eqz v0, :cond_c

    .line 460
    .line 461
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->e()Ll/hny0;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    invoke-virtual {v0}, Ll/hny0;->K0()J

    .line 466
    .line 467
    .line 468
    move-result-wide v24

    .line 469
    :cond_c
    :goto_9
    move-wide/from16 v37, v24

    .line 470
    .line 471
    goto :goto_a

    .line 472
    :cond_d
    move/from16 v27, v0

    .line 473
    .line 474
    goto :goto_9

    .line 475
    :goto_a
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    invoke-virtual {v0}, Ll/ajr0;->N()Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v39

    .line 483
    invoke-virtual/range {p0 .. p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 484
    .line 485
    .line 486
    move-result-object v0

    .line 487
    move/from16 v2, v23

    .line 488
    .line 489
    invoke-virtual {v0, v15, v2}, Ll/ajr0;->v(Ljava/lang/String;Z)Lcom/google/android/gms/measurement/internal/zzjh;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    new-instance v2, Ll/hyv0;

    .line 494
    .line 495
    invoke-direct {v2, v0}, Ll/hyv0;-><init>(Lcom/google/android/gms/measurement/internal/zzjh;)V

    .line 496
    .line 497
    .line 498
    invoke-virtual {v2}, Ll/hyv0;->c()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v40

    .line 502
    move-object v0, v7

    .line 503
    move-wide/from16 v24, v11

    .line 504
    .line 505
    move v12, v8

    .line 506
    const-wide/32 v7, 0x19e10

    .line 507
    .line 508
    .line 509
    move-object/from16 v23, v28

    .line 510
    .line 511
    move-object/from16 v28, v29

    .line 512
    .line 513
    move-object/from16 v29, v31

    .line 514
    .line 515
    move/from16 v31, v1

    .line 516
    .line 517
    move-object/from16 v1, v21

    .line 518
    .line 519
    move/from16 v21, v14

    .line 520
    .line 521
    move-object/from16 v14, v20

    .line 522
    .line 523
    move/from16 v20, v26

    .line 524
    .line 525
    move-object/from16 v26, v30

    .line 526
    .line 527
    move-object/from16 v30, v16

    .line 528
    .line 529
    const-wide/16 v15, 0x0

    .line 530
    .line 531
    move-object/from16 v2, v32

    .line 532
    .line 533
    move-wide/from16 v32, v33

    .line 534
    .line 535
    move/from16 v34, v36

    .line 536
    .line 537
    move/from16 v36, v27

    .line 538
    .line 539
    const/16 v27, 0x0

    .line 540
    .line 541
    move-object/from16 v11, p1

    .line 542
    .line 543
    invoke-direct/range {v0 .. v40}, Lcom/google/android/gms/measurement/internal/zzo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;JJIZZLjava/lang/String;Ljava/lang/Boolean;JLjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJILjava/lang/String;IJLjava/lang/String;Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    return-object v0
.end method

.method public final w()I
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/gms/measurement/internal/c;->k:I

    .line 5
    .line 6
    return p0
.end method

.method public final x()I
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/gms/measurement/internal/c;->e:I

    .line 5
    .line 6
    return p0
.end method

.method public final y()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/c;->m:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public final z()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/c;->c:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/c;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final bridge synthetic zza()Landroid/content/Context;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzb()Lcom/google/android/gms/common/util/Clock;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzd()Ll/zbr0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzd()Ll/zbr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzj()Ll/d6x0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzl()Ll/qsx0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
