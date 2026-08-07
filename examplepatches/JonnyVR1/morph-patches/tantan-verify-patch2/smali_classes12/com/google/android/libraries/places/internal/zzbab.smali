.class public final Lcom/google/android/libraries/places/internal/zzbab;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Lcom/google/android/libraries/places/internal/zzbac;

.field private zzc:Ljava/lang/Long;

.field private zzd:Lcom/google/android/libraries/places/internal/zzbau;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbab;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbab;->zza:Ljava/lang/String;

    return-object p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbac;)Lcom/google/android/libraries/places/internal/zzbab;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzb:Lcom/google/android/libraries/places/internal/zzbac;

    return-object p0
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzbau;)Lcom/google/android/libraries/places/internal/zzbab;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzd:Lcom/google/android/libraries/places/internal/zzbau;

    return-object p0
.end method

.method public final zzd(J)Lcom/google/android/libraries/places/internal/zzbab;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzc:Ljava/lang/Long;

    .line 6
    .line 7
    return-object p0
.end method

.method public final zze()Lcom/google/android/libraries/places/internal/zzbae;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbab;->zza:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "description"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzb:Lcom/google/android/libraries/places/internal/zzbac;

    .line 9
    .line 10
    const-string v1, "severity"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzc:Ljava/lang/Long;

    .line 16
    .line 17
    const-string v1, "timestampNanos"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbae;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbab;->zza:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzb:Lcom/google/android/libraries/places/internal/zzbac;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzc:Ljava/lang/Long;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v5

    .line 34
    iget-object v8, p0, Lcom/google/android/libraries/places/internal/zzbab;->zzd:Lcom/google/android/libraries/places/internal/zzbau;

    .line 35
    .line 36
    const/4 v9, 0x0

    .line 37
    const/4 v7, 0x0

    .line 38
    invoke-direct/range {v2 .. v9}, Lcom/google/android/libraries/places/internal/zzbae;-><init>(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzbac;JLcom/google/android/libraries/places/internal/zzbau;Lcom/google/android/libraries/places/internal/zzbau;Lcom/google/android/libraries/places/internal/zzbad;)V

    .line 39
    .line 40
    .line 41
    return-object v2
.end method
