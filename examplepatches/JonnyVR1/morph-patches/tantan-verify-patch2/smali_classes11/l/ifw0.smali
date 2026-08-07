.class public final Ll/ifw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/internal/ads/zzfom;

.field public final b:Lcom/google/android/gms/internal/ads/zzfom;

.field public final c:Lcom/google/android/gms/internal/ads/zzfoi;

.field public final d:Lcom/google/android/gms/internal/ads/zzfol;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzfoi;Lcom/google/android/gms/internal/ads/zzfol;Lcom/google/android/gms/internal/ads/zzfom;Lcom/google/android/gms/internal/ads/zzfom;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ifw0;->c:Lcom/google/android/gms/internal/ads/zzfoi;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ifw0;->d:Lcom/google/android/gms/internal/ads/zzfol;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ifw0;->a:Lcom/google/android/gms/internal/ads/zzfom;

    .line 9
    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    sget-object p1, Lcom/google/android/gms/internal/ads/zzfom;->zzc:Lcom/google/android/gms/internal/ads/zzfom;

    .line 13
    .line 14
    iput-object p1, p0, Ll/ifw0;->b:Lcom/google/android/gms/internal/ads/zzfom;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput-object p4, p0, Ll/ifw0;->b:Lcom/google/android/gms/internal/ads/zzfom;

    .line 18
    .line 19
    return-void
.end method

.method public static a(Lcom/google/android/gms/internal/ads/zzfoi;Lcom/google/android/gms/internal/ads/zzfol;Lcom/google/android/gms/internal/ads/zzfom;Lcom/google/android/gms/internal/ads/zzfom;Z)Ll/ifw0;
    .locals 6

    .line 1
    const-string p4, "ImpressionType is null"

    .line 2
    .line 3
    invoke-static {p1, p4}, Ll/tgw0;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "Impression owner is null"

    .line 7
    .line 8
    invoke-static {p2, p4}, Ll/tgw0;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p4, Lcom/google/android/gms/internal/ads/zzfom;->zzc:Lcom/google/android/gms/internal/ads/zzfom;

    .line 12
    .line 13
    if-eq p2, p4, :cond_4

    .line 14
    .line 15
    sget-object p4, Lcom/google/android/gms/internal/ads/zzfoi;->zza:Lcom/google/android/gms/internal/ads/zzfoi;

    .line 16
    .line 17
    const-string v0, "ImpressionType/CreativeType can only be defined as DEFINED_BY_JAVASCRIPT if Impression Owner is JavaScript"

    .line 18
    .line 19
    if-ne p0, p4, :cond_1

    .line 20
    .line 21
    sget-object p4, Lcom/google/android/gms/internal/ads/zzfom;->zza:Lcom/google/android/gms/internal/ads/zzfom;

    .line 22
    .line 23
    if-eq p2, p4, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const/4 p0, 0x0

    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_1
    sget-object p4, Lcom/google/android/gms/internal/ads/zzfol;->zza:Lcom/google/android/gms/internal/ads/zzfol;

    .line 32
    .line 33
    if-ne p1, p4, :cond_3

    .line 34
    .line 35
    sget-object p4, Lcom/google/android/gms/internal/ads/zzfom;->zza:Lcom/google/android/gms/internal/ads/zzfom;

    .line 36
    .line 37
    if-eq p2, p4, :cond_2

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_2
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    :goto_2
    new-instance v0, Ll/ifw0;

    .line 45
    .line 46
    const/4 v5, 0x1

    .line 47
    move-object v1, p0

    .line 48
    move-object v2, p1

    .line 49
    move-object v3, p2

    .line 50
    move-object v4, p3

    .line 51
    invoke-direct/range {v0 .. v5}, Ll/ifw0;-><init>(Lcom/google/android/gms/internal/ads/zzfoi;Lcom/google/android/gms/internal/ads/zzfol;Lcom/google/android/gms/internal/ads/zzfom;Lcom/google/android/gms/internal/ads/zzfom;Z)V

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_4
    const-string p0, "Impression owner is none"

    .line 56
    .line 57
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0
.end method


# virtual methods
.method public final b()Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "impressionOwner"

    .line 7
    .line 8
    iget-object v2, p0, Ll/ifw0;->a:Lcom/google/android/gms/internal/ads/zzfom;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Ll/qgw0;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "mediaEventsOwner"

    .line 14
    .line 15
    iget-object v2, p0, Ll/ifw0;->b:Lcom/google/android/gms/internal/ads/zzfom;

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Ll/qgw0;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "creativeType"

    .line 21
    .line 22
    iget-object v2, p0, Ll/ifw0;->c:Lcom/google/android/gms/internal/ads/zzfoi;

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/qgw0;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const-string v1, "impressionType"

    .line 28
    .line 29
    iget-object p0, p0, Ll/ifw0;->d:Lcom/google/android/gms/internal/ads/zzfol;

    .line 30
    .line 31
    invoke-static {v0, v1, p0}, Ll/qgw0;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "isolateVerificationScripts"

    .line 35
    .line 36
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-static {v0, p0, v1}, Ll/qgw0;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method
