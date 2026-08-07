.class final Lcom/google/android/libraries/places/internal/zzbrc;
.super Lcom/google/android/libraries/places/internal/zzbrh;
.source "SourceFile"


# instance fields
.field final zza:Lcom/google/android/libraries/places/internal/zzbvq;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbri;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbri;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzbrh;-><init>(Lcom/google/android/libraries/places/internal/zzbri;Lcom/google/android/libraries/places/internal/zzbrg;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbvr;->zza()Lcom/google/android/libraries/places/internal/zzbvq;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zza:Lcom/google/android/libraries/places/internal/zzbvq;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbwb;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbri;->zze(Lcom/google/android/libraries/places/internal/zzbri;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbri;->zzg(Lcom/google/android/libraries/places/internal/zzbri;)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbri;->zzg(Lcom/google/android/libraries/places/internal/zzbri;)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzf()J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    invoke-virtual {v0, v3, v4, v5}, Lcom/google/android/libraries/places/internal/zzbwb;->zzn(Lcom/google/android/libraries/places/internal/zzbwb;J)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzbri;->zzl(Lcom/google/android/libraries/places/internal/zzbri;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbri;->zzb(Lcom/google/android/libraries/places/internal/zzbri;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 45
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbri;->zzh(Lcom/google/android/libraries/places/internal/zzbri;)Lcom/google/android/libraries/places/internal/zzbwq;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzg()J

    .line 52
    .line 53
    .line 54
    move-result-wide v3

    .line 55
    invoke-interface {v1, v0, v3, v4}, Lcom/google/android/libraries/places/internal/zzbwq;->zzn(Lcom/google/android/libraries/places/internal/zzbwb;J)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbri;->zze(Lcom/google/android/libraries/places/internal/zzbri;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    monitor-enter v0

    .line 65
    :try_start_1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrc;->zzb:Lcom/google/android/libraries/places/internal/zzbri;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbri;->zzb(Lcom/google/android/libraries/places/internal/zzbri;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    sub-int/2addr v1, v2

    .line 72
    invoke-static {p0, v1}, Lcom/google/android/libraries/places/internal/zzbri;->zzk(Lcom/google/android/libraries/places/internal/zzbri;I)V

    .line 73
    .line 74
    .line 75
    monitor-exit v0

    .line 76
    return-void

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    throw p0

    .line 80
    :catchall_1
    move-exception p0

    .line 81
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 82
    throw p0
.end method
