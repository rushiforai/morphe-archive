.class public final Ll/tnx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/atx0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/j;->o0()Ll/atx0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/tnx0;->a:Ll/atx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ll/h4t0;)Landroid/os/Bundle;
    .locals 3
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/atx0;->zzl()Ll/qsx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "Attempting to use Install Referrer Service while it is not initialized"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    .line 30
    .line 31
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "package_name"

    .line 35
    .line 36
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :try_start_0
    invoke-interface {p2, v1}, Ll/h4t0;->zza(Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Ll/tnx0;->a:Ll/atx0;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/atx0;->zzj()Ll/d6x0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/d6x0;->A()Ll/l8x0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string p2, "Install Referrer Service returned a null response"

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-object v0

    .line 61
    :catch_0
    move-exception p1

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    return-object p1

    .line 64
    :goto_0
    iget-object p0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p2, "Exception occurred while retrieving the Install Referrer"

    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p2, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-object v0
.end method

.method public final b()Z
    .locals 4
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/tnx0;->a:Ll/atx0;

    .line 3
    .line 4
    invoke-virtual {v1}, Ll/atx0;->zza()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {v1}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/tnx0;->a:Ll/atx0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/atx0;->zzj()Ll/d6x0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/d6x0;->E()Ll/l8x0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Failed to get PackageManager for Install Referrer Play Store compatibility check"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return v0

    .line 30
    :catch_0
    move-exception v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, "com.android.vending"

    .line 33
    .line 34
    const/16 v3, 0x80

    .line 35
    .line 36
    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget p0, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    const v1, 0x4d17ab4

    .line 43
    .line 44
    .line 45
    if-lt p0, v1, :cond_1

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_1
    return v0

    .line 50
    :goto_0
    iget-object p0, p0, Ll/tnx0;->a:Ll/atx0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string v2, "Failed to retrieve Play Store version for Install Referrer"

    .line 61
    .line 62
    invoke-virtual {p0, v2, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return v0
.end method
