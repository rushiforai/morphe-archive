.class public final Lcom/google/android/libraries/places/internal/zzfa;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Ll/b3d0;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzij;


# direct methods
.method public constructor <init>(Ll/b3d0;Lcom/google/android/libraries/places/internal/zzij;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzfa;->zza:Ll/b3d0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzfa;->zzb:Lcom/google/android/libraries/places/internal/zzij;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic zzc(Ll/sni0;Lcom/android/volley/VolleyError;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzeu;->zza(Lcom/android/volley/VolleyError;)Lcom/google/android/gms/common/api/ApiException;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/sni0;->d(Ljava/lang/Exception;)Z
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzfi;Ljava/lang/Class;)Lcom/google/android/gms/tasks/Task;
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzfi;->zzc()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzfi;->zzd()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzfi;->zza()Ll/gg4;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/sni0;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/sni0;-><init>(Ll/gg4;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    move-object v8, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v0, Ll/sni0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/sni0;-><init>()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzez;

    .line 29
    .line 30
    new-instance v5, Lcom/google/android/libraries/places/internal/zzew;

    .line 31
    .line 32
    invoke-direct {v5, p0, p2, v8}, Lcom/google/android/libraries/places/internal/zzew;-><init>(Lcom/google/android/libraries/places/internal/zzfa;Ljava/lang/Class;Ll/sni0;)V

    .line 33
    .line 34
    .line 35
    new-instance v6, Lcom/google/android/libraries/places/internal/zzex;

    .line 36
    .line 37
    invoke-direct {v6, v8}, Lcom/google/android/libraries/places/internal/zzex;-><init>(Ll/sni0;)V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    const/4 v4, 0x0

    .line 42
    move-object v1, p0

    .line 43
    invoke-direct/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzez;-><init>(Lcom/google/android/libraries/places/internal/zzfa;ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/d$b;Lcom/android/volley/d$a;Ljava/util/Map;)V

    .line 44
    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    new-instance p0, Lcom/google/android/libraries/places/internal/zzey;

    .line 49
    .line 50
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzey;-><init>(Ll/qrq;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p0, v1, Lcom/google/android/libraries/places/internal/zzfa;->zza:Ll/b3d0;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/b3d0;->a(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v8}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public final synthetic zzb(Ljava/lang/Class;Ll/sni0;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzfa;->zzb:Lcom/google/android/libraries/places/internal/zzij;

    .line 2
    .line 3
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p0, p3, p1}, Lcom/google/android/libraries/places/internal/zzij;->zza(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/google/android/libraries/places/internal/zzfj;

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Ll/sni0;->e(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/google/android/libraries/places/internal/zzfk; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    :try_start_1
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 19
    .line 20
    new-instance p3, Lcom/google/android/gms/common/api/Status;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    invoke-direct {p3, v0, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p1, p3}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p1}, Ll/sni0;->d(Ljava/lang/Exception;)Z
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_1
    move-exception p0

    .line 39
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    throw p0
.end method
