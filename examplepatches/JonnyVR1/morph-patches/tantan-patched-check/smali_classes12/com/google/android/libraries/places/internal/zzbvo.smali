.class public final Lcom/google/android/libraries/places/internal/zzbvo;
.super Lcom/google/android/libraries/places/internal/zzbbo;
.source "SourceFile"


# static fields
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbbo;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbbd;)Lcom/google/android/libraries/places/internal/zzbbm;
    .locals 0

    .line 1
    new-instance p0, Lcom/google/android/libraries/places/internal/zzbvn;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzbvn;-><init>(Lcom/google/android/libraries/places/internal/zzbbd;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final zzb()I
    .locals 0

    const/4 p0, 0x5

    return p0
.end method

.method public final zzc(Ljava/util/Map;)Lcom/google/android/libraries/places/internal/zzbcp;
    .locals 0

    const-string p0, "no service config"

    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbcp;->zza(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbcp;

    move-result-object p0

    return-object p0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 0

    const-string p0, "round_robin"

    return-object p0
.end method

.method public final zze()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
