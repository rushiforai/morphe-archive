.class final Lcom/google/android/libraries/places/internal/zzbrw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbec;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbry;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbry;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 3

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbry;->zzC(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbrx;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbrx;->zzJ(Lcom/google/android/libraries/places/internal/zzbrx;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbry;->zzC(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbrx;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v1, 0x1

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {p0, p1, v1, v2}, Lcom/google/android/libraries/places/internal/zzbrx;->zzK(Lcom/google/android/libraries/places/internal/zzbrx;Lcom/google/android/libraries/places/internal/zzbdo;ZLcom/google/android/libraries/places/internal/zzbcf;)V

    .line 23
    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbra;ZZI)V
    .locals 2

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbry;->zzG()Lcom/google/android/libraries/places/internal/zzbwb;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbsn;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbsn;->zze()Lcom/google/android/libraries/places/internal/zzbwb;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzg()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    long-to-int v0, v0

    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzbry;->zzH(Lcom/google/android/libraries/places/internal/zzbry;I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbry;->zzC(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbrx;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbrx;->zzJ(Lcom/google/android/libraries/places/internal/zzbrx;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    monitor-enter v0

    .line 39
    :try_start_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbry;->zzC(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbrx;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbrx;->zzL(Lcom/google/android/libraries/places/internal/zzbrx;Lcom/google/android/libraries/places/internal/zzbwb;ZZ)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbry;->zzA(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbqz;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p4}, Lcom/google/android/libraries/places/internal/zzbqz;->zzd(I)V

    .line 55
    .line 56
    .line 57
    monitor-exit v0

    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception p0

    .line 60
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzbcf;[B)V
    .locals 2

    .line 1
    const-string p2, "/"

    .line 2
    .line 3
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbry;->zzy(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbcl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbcl;->zzf()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbry;->zzC(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbrx;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbrx;->zzJ(Lcom/google/android/libraries/places/internal/zzbrx;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    monitor-enter v0

    .line 38
    :try_start_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrw;->zza:Lcom/google/android/libraries/places/internal/zzbry;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbry;->zzC(Lcom/google/android/libraries/places/internal/zzbry;)Lcom/google/android/libraries/places/internal/zzbrx;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbrx;->zzM(Lcom/google/android/libraries/places/internal/zzbrx;Lcom/google/android/libraries/places/internal/zzbcf;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method
