.class public Lcom/google/android/libraries/places/internal/zzaul;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzatf;


# instance fields
.field protected volatile zza:Lcom/google/android/libraries/places/internal/zzavf;

.field private volatile zzc:Lcom/google/android/libraries/places/internal/zzask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzatf;->zza:Lcom/google/android/libraries/places/internal/zzatf;

    .line 2
    .line 3
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaul;->zzb:Lcom/google/android/libraries/places/internal/zzatf;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lcom/google/android/libraries/places/internal/zzaul;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzaul;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 16
    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzaul;->zzb()Lcom/google/android/libraries/places/internal/zzask;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzaul;->zzb()Lcom/google/android/libraries/places/internal/zzask;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzask;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_3
    :goto_0
    if-eqz v0, :cond_5

    .line 36
    .line 37
    if-nez v1, :cond_4

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_5
    :goto_1
    if-eqz v0, :cond_6

    .line 46
    .line 47
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavg;->zzaL()Lcom/google/android/libraries/places/internal/zzavf;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzaul;->zzd(Lcom/google/android/libraries/places/internal/zzavf;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p1, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_6
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzavg;->zzaL()Lcom/google/android/libraries/places/internal/zzavf;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzaul;->zzd(Lcom/google/android/libraries/places/internal/zzavf;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0
.end method

.method public hashCode()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final zza()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 6
    .line 7
    check-cast p0, Lcom/google/android/libraries/places/internal/zzash;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzash;->zza:[B

    .line 10
    .line 11
    array-length p0, p0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzavf;->zzaq()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final zzb()Lcom/google/android/libraries/places/internal/zzask;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    monitor-enter p0

    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-object v0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    sget-object v0, Lcom/google/android/libraries/places/internal/zzask;->zzb:Lcom/google/android/libraries/places/internal/zzask;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavf;->zzal()Lcom/google/android/libraries/places/internal/zzask;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 35
    .line 36
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-object v0

    .line 40
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw v0
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzavf;
    .locals 2

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    return-object v0
.end method

.method public final zzd(Lcom/google/android/libraries/places/internal/zzavf;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_2

    .line 15
    :cond_1
    :try_start_1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 16
    .line 17
    sget-object v0, Lcom/google/android/libraries/places/internal/zzask;->zzb:Lcom/google/android/libraries/places/internal/zzask;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;
    :try_end_1
    .catch Lcom/google/android/libraries/places/internal/zzauf; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    :try_start_2
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaul;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 23
    .line 24
    sget-object p1, Lcom/google/android/libraries/places/internal/zzask;->zzb:Lcom/google/android/libraries/places/internal/zzask;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaul;->zzc:Lcom/google/android/libraries/places/internal/zzask;

    .line 27
    .line 28
    :goto_0
    monitor-exit p0

    .line 29
    :goto_1
    return-void

    .line 30
    :goto_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 31
    throw p1
.end method
