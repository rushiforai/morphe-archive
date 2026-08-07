.class public Lcom/google/android/gms/ads/internal/util/WorkManagerUtil;
.super Ll/rvs0;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Lcom/google/android/apps/common/proguard/UsedByReflection;
        value = "This class must be instantiated reflectively so that the default class loader can be used."
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/rvs0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static o8(Landroid/content/Context;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Landroidx/work/a$a;

    .line 6
    .line 7
    invoke-direct {v0}, Landroidx/work/a$a;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/work/a$a;->a()Landroidx/work/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p0, v0}, Landroidx/work/WorkManager;->i(Landroid/content/Context;Landroidx/work/a;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    :catch_0
    return-void
.end method


# virtual methods
.method public final zze(Ll/p1m;)V
    .locals 3
    .param p1    # Ll/p1m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/google/android/gms/ads/internal/util/WorkManagerUtil;->o8(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {p0}, Landroidx/work/WorkManager;->h(Landroid/content/Context;)Landroidx/work/WorkManager;

    .line 11
    .line 12
    .line 13
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    const-string p1, "offline_ping_sender_work"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/work/WorkManager;->a(Ljava/lang/String;)Landroidx/work/d;

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/l06$a;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/l06$a;-><init>()V

    .line 22
    .line 23
    .line 24
    sget-object v1, Landroidx/work/NetworkType;->CONNECTED:Landroidx/work/NetworkType;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/l06$a;->b(Landroidx/work/NetworkType;)Ll/l06$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/l06$a;->a()Ll/l06;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Landroidx/work/c$a;

    .line 35
    .line 36
    const-class v2, Lcom/google/android/gms/ads/internal/offline/buffering/OfflinePingSender;

    .line 37
    .line 38
    invoke-direct {v1, v2}, Landroidx/work/c$a;-><init>(Ljava/lang/Class;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroidx/work/h$a;->i(Ll/l06;)Landroidx/work/h$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroidx/work/c$a;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroidx/work/h$a;->a(Ljava/lang/String;)Landroidx/work/h$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Landroidx/work/c$a;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroidx/work/h$a;->b()Landroidx/work/h;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Landroidx/work/c;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroidx/work/WorkManager;->c(Landroidx/work/h;)Landroidx/work/d;

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    move-exception p0

    .line 64
    const-string p1, "Failed to instantiate WorkManager."

    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final zzf(Ll/p1m;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1    # Ll/p1m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/google/android/gms/ads/internal/offline/buffering/zza;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, p2, p3, v1}, Lcom/google/android/gms/ads/internal/offline/buffering/zza;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/ads/internal/util/WorkManagerUtil;->zzg(Ll/p1m;Lcom/google/android/gms/ads/internal/offline/buffering/zza;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final zzg(Ll/p1m;Lcom/google/android/gms/ads/internal/offline/buffering/zza;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/google/android/gms/ads/internal/util/WorkManagerUtil;->o8(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/l06$a;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/l06$a;-><init>()V

    .line 13
    .line 14
    .line 15
    sget-object v0, Landroidx/work/NetworkType;->CONNECTED:Landroidx/work/NetworkType;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/l06$a;->b(Landroidx/work/NetworkType;)Ll/l06$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/l06$a;->a()Ll/l06;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Landroidx/work/Data$a;

    .line 26
    .line 27
    invoke-direct {v0}, Landroidx/work/Data$a;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "uri"

    .line 31
    .line 32
    iget-object v2, p2, Lcom/google/android/gms/ads/internal/offline/buffering/zza;->zza:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroidx/work/Data$a;->f(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "gws_query_id"

    .line 39
    .line 40
    iget-object v2, p2, Lcom/google/android/gms/ads/internal/offline/buffering/zza;->zzb:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroidx/work/Data$a;->f(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "image_url"

    .line 47
    .line 48
    iget-object p2, p2, Lcom/google/android/gms/ads/internal/offline/buffering/zza;->zzc:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1, p2}, Landroidx/work/Data$a;->f(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$a;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Landroidx/work/Data$a;->a()Landroidx/work/Data;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    new-instance v0, Landroidx/work/c$a;

    .line 59
    .line 60
    const-class v1, Lcom/google/android/gms/ads/internal/offline/buffering/OfflineNotificationPoster;

    .line 61
    .line 62
    invoke-direct {v0, v1}, Landroidx/work/c$a;-><init>(Ljava/lang/Class;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p1}, Landroidx/work/h$a;->i(Ll/l06;)Landroidx/work/h$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Landroidx/work/c$a;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Landroidx/work/h$a;->k(Landroidx/work/Data;)Landroidx/work/h$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Landroidx/work/c$a;

    .line 76
    .line 77
    const-string p2, "offline_notification_work"

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroidx/work/h$a;->a(Ljava/lang/String;)Landroidx/work/h$a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Landroidx/work/c$a;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroidx/work/h$a;->b()Landroidx/work/h;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Landroidx/work/c;

    .line 90
    .line 91
    :try_start_0
    invoke-static {p0}, Landroidx/work/WorkManager;->h(Landroid/content/Context;)Landroidx/work/WorkManager;

    .line 92
    .line 93
    .line 94
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    invoke-virtual {p0, p1}, Landroidx/work/WorkManager;->c(Landroidx/work/h;)Landroidx/work/d;

    .line 96
    .line 97
    .line 98
    const/4 p0, 0x1

    .line 99
    return p0

    .line 100
    :catch_0
    move-exception p0

    .line 101
    const-string p1, "Failed to instantiate WorkManager."

    .line 102
    .line 103
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    const/4 p0, 0x0

    .line 107
    return p0
.end method
