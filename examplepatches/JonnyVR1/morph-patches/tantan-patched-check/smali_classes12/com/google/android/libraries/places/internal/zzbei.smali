.class public abstract Lcom/google/android/libraries/places/internal/zzbei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbel;
.implements Lcom/google/android/libraries/places/internal/zzbmm;


# instance fields
.field private zzr:Lcom/google/android/libraries/places/internal/zzbgj;

.field private final zzs:Ljava/lang/Object;

.field private final zzt:Lcom/google/android/libraries/places/internal/zzbqo;

.field private final zzu:Lcom/google/android/libraries/places/internal/zzbqz;

.field private final zzv:Lcom/google/android/libraries/places/internal/zzbmq;

.field private zzw:I

.field private zzx:Z

.field private zzy:Z

.field private final zzz:I


# direct methods
.method public constructor <init>(ILcom/google/android/libraries/places/internal/zzbqo;Lcom/google/android/libraries/places/internal/zzbqz;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzt:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzu:Lcom/google/android/libraries/places/internal/zzbqz;

    .line 14
    .line 15
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbmq;

    .line 16
    .line 17
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaza;->zza:Lcom/google/android/libraries/places/internal/zzazb;

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move v4, p1

    .line 21
    move-object v5, p2

    .line 22
    move-object v6, p3

    .line 23
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbmq;-><init>(Lcom/google/android/libraries/places/internal/zzbmm;Lcom/google/android/libraries/places/internal/zzazo;ILcom/google/android/libraries/places/internal/zzbqo;Lcom/google/android/libraries/places/internal/zzbqz;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, v2, Lcom/google/android/libraries/places/internal/zzbei;->zzv:Lcom/google/android/libraries/places/internal/zzbmq;

    .line 27
    .line 28
    iput-object v1, v2, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 29
    .line 30
    const p0, 0x8000

    .line 31
    .line 32
    .line 33
    iput p0, v2, Lcom/google/android/libraries/places/internal/zzbei;->zzz:I

    .line 34
    .line 35
    return-void
.end method

.method private final zzb()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zzc()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zza()Lcom/google/android/libraries/places/internal/zzbqr;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbqr;->zzg()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0
.end method

.method private final zzc()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzx:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzw:I

    .line 10
    .line 11
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzz:I

    .line 12
    .line 13
    if-ge v1, v3, :cond_0

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzy:Z

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return v2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public static bridge synthetic zzl(Lcom/google/android/libraries/places/internal/zzbei;)Lcom/google/android/libraries/places/internal/zzbgj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    return-object p0
.end method

.method public static bridge synthetic zzn(Lcom/google/android/libraries/places/internal/zzbei;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzw:I

    .line 5
    .line 6
    add-int/2addr v1, p1

    .line 7
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzw:I

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public static bridge synthetic zzo(Lcom/google/android/libraries/places/internal/zzbei;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbvr;->zza()Lcom/google/android/libraries/places/internal/zzbvq;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbeh;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/libraries/places/internal/zzbeh;-><init>(Lcom/google/android/libraries/places/internal/zzbei;Lcom/google/android/libraries/places/internal/zzbvq;I)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzbel;->zzz(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic zzy(Lcom/google/android/libraries/places/internal/zzbei;)Z
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zzc()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public abstract zza()Lcom/google/android/libraries/places/internal/zzbqr;
.end method

.method public final zzm()Lcom/google/android/libraries/places/internal/zzbqz;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzu:Lcom/google/android/libraries/places/internal/zzbqz;

    return-object p0
.end method

.method public final zzp(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbgj;->close()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbgj;->zza()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final zzq(Lcom/google/android/libraries/places/internal/zzbnv;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/google/android/libraries/places/internal/zzbgj;->zzb(Lcom/google/android/libraries/places/internal/zzbnv;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbmm;->zzF(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final zzr(Lcom/google/android/libraries/places/internal/zzbqq;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zza()Lcom/google/android/libraries/places/internal/zzbqr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbqr;->zzf(Lcom/google/android/libraries/places/internal/zzbqq;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzs(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzx:Z

    .line 5
    .line 6
    const-string v2, "onStreamAllocated was not called, but it seems the stream is active"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzw:I

    .line 12
    .line 13
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzz:I

    .line 14
    .line 15
    sub-int p1, v1, p1

    .line 16
    .line 17
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzw:I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-lt v1, v2, :cond_0

    .line 21
    .line 22
    if-ge p1, v2, :cond_0

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zzb()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method public final zzt()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zza()Lcom/google/android/libraries/places/internal/zzbqr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzo(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    iget-boolean v2, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzx:Z

    .line 18
    .line 19
    xor-int/2addr v2, v1

    .line 20
    const-string v3, "Already allocated"

    .line 21
    .line 22
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzx:Z

    .line 26
    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zzb()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method public final zzu()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzs:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzy:Z

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public final zzv()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzv:Lcom/google/android/libraries/places/internal/zzbmq;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzbmq;->zzf(Lcom/google/android/libraries/places/internal/zzbmm;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzv:Lcom/google/android/libraries/places/internal/zzbmq;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 9
    .line 10
    return-void
.end method

.method public final zzw(Lcom/google/android/libraries/places/internal/zzazo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbgj;->zzd(Lcom/google/android/libraries/places/internal/zzazo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzx(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbei;->zzr:Lcom/google/android/libraries/places/internal/zzbgj;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbgj;->zze(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
