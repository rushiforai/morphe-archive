.class final Lcom/google/android/libraries/places/internal/zzbkv;
.super Lcom/google/android/libraries/places/internal/zzazv;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbam;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzayk;

.field private final zzc:Ljava/util/concurrent/Executor;

.field private final zzd:Lcom/google/android/libraries/places/internal/zzbcl;

.field private final zze:Lcom/google/android/libraries/places/internal/zzazj;

.field private zzf:Lcom/google/android/libraries/places/internal/zzayj;

.field private zzg:Lcom/google/android/libraries/places/internal/zzayo;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbam;Lcom/google/android/libraries/places/internal/zzayk;Ljava/util/concurrent/Executor;Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzazv;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zza:Lcom/google/android/libraries/places/internal/zzbam;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzb:Lcom/google/android/libraries/places/internal/zzayk;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 9
    .line 10
    invoke-virtual {p5}, Lcom/google/android/libraries/places/internal/zzayj;->zzn()Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p5}, Lcom/google/android/libraries/places/internal/zzayj;->zzn()Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    :cond_0
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzc:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    invoke-virtual {p5, p3}, Lcom/google/android/libraries/places/internal/zzayj;->zzb(Ljava/util/concurrent/Executor;)Lcom/google/android/libraries/places/internal/zzayj;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzf:Lcom/google/android/libraries/places/internal/zzayj;

    .line 27
    .line 28
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazj;->zzb()Lcom/google/android/libraries/places/internal/zzazj;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zze:Lcom/google/android/libraries/places/internal/zzazj;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic zzg(Lcom/google/android/libraries/places/internal/zzbkv;)Lcom/google/android/libraries/places/internal/zzazj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zze:Lcom/google/android/libraries/places/internal/zzazj;

    return-object p0
.end method


# virtual methods
.method public final zza(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzg:Lcom/google/android/libraries/places/internal/zzayo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzayo;->zza(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zze(Lcom/google/android/libraries/places/internal/zzayn;Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnr;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzf:Lcom/google/android/libraries/places/internal/zzayj;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 6
    .line 7
    invoke-direct {v0, v2, p2, v1}, Lcom/google/android/libraries/places/internal/zzbnr;-><init>(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zza:Lcom/google/android/libraries/places/internal/zzbam;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbam;->zza(Lcom/google/android/libraries/places/internal/zzbbf;)Lcom/google/android/libraries/places/internal/zzbal;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbal;->zzb()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzl()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbjd;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzc:Ljava/util/concurrent/Executor;

    .line 31
    .line 32
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbku;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbku;-><init>(Lcom/google/android/libraries/places/internal/zzbkv;Lcom/google/android/libraries/places/internal/zzayn;Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbma;->zzh()Lcom/google/android/libraries/places/internal/zzayo;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzg:Lcom/google/android/libraries/places/internal/zzayo;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbal;->zzc()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 52
    .line 53
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbmj;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbmj;->zzb(Lcom/google/android/libraries/places/internal/zzbcl;)Lcom/google/android/libraries/places/internal/zzbmg;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzf:Lcom/google/android/libraries/places/internal/zzayj;

    .line 62
    .line 63
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbmg;->zza:Lcom/google/android/libraries/places/internal/zzayh;

    .line 64
    .line 65
    invoke-virtual {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzayj;->zze(Lcom/google/android/libraries/places/internal/zzayh;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzayj;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzf:Lcom/google/android/libraries/places/internal/zzayj;

    .line 70
    .line 71
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzb:Lcom/google/android/libraries/places/internal/zzayk;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzf:Lcom/google/android/libraries/places/internal/zzayj;

    .line 76
    .line 77
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzg:Lcom/google/android/libraries/places/internal/zzayo;

    .line 82
    .line 83
    invoke-virtual {v0, p1, p2}, Lcom/google/android/libraries/places/internal/zzayo;->zze(Lcom/google/android/libraries/places/internal/zzayn;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final zzf()Lcom/google/android/libraries/places/internal/zzayo;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkv;->zzg:Lcom/google/android/libraries/places/internal/zzayo;

    return-object p0
.end method
