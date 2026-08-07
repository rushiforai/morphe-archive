.class public final Lcom/google/android/libraries/places/internal/zzmm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzmk;

.field private zzc:Lcom/google/android/libraries/places/internal/zzmk;

.field private zzd:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzml;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Lcom/google/android/libraries/places/internal/zzmk;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/google/android/libraries/places/internal/zzmk;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzb:Lcom/google/android/libraries/places/internal/zzmk;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    iput-boolean p2, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzd:Z

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzmm;->zza:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method private final zzh()Lcom/google/android/libraries/places/internal/zzmk;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzmk;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzmk;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 7
    .line 8
    iput-object v0, v1, Lcom/google/android/libraries/places/internal/zzmk;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 11
    .line 12
    return-object v0
.end method

.method private final zzi(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzmj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzmj;-><init>(Lcom/google/android/libraries/places/internal/zzmi;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 8
    .line 9
    iput-object v0, v1, Lcom/google/android/libraries/places/internal/zzmk;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 12
    .line 13
    iput-object p2, v0, Lcom/google/android/libraries/places/internal/zzmk;->zzb:Ljava/lang/Object;

    .line 14
    .line 15
    iput-object p1, v0, Lcom/google/android/libraries/places/internal/zzmk;->zza:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzd:Z

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const/16 v2, 0x20

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzmm;->zza:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const/16 v2, 0x7b

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzb:Lcom/google/android/libraries/places/internal/zzmk;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzmk;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 23
    .line 24
    const-string v2, ""

    .line 25
    .line 26
    :goto_0
    if-eqz p0, :cond_4

    .line 27
    .line 28
    instance-of v3, p0, Lcom/google/android/libraries/places/internal/zzmj;

    .line 29
    .line 30
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzmk;->zzb:Ljava/lang/Object;

    .line 31
    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    if-nez v4, :cond_0

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzmk;->zza:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const/16 v2, 0x3d

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    :cond_1
    if-eqz v4, :cond_2

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v2}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    add-int/lit8 v3, v3, -0x1

    .line 78
    .line 79
    const/4 v4, 0x1

    .line 80
    invoke-virtual {v1, v2, v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    :goto_1
    const-string v2, ", "

    .line 88
    .line 89
    :cond_3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzmk;->zzc:Lcom/google/android/libraries/places/internal/zzmk;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_4
    const/16 p0, 0x7d

    .line 93
    .line 94
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

.method public final zza(Ljava/lang/String;D)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 0

    .line 1
    const-string p1, "backoffMultiplier"

    .line 2
    .line 3
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzmm;->zzi(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final zzb(Ljava/lang/String;I)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzmm;->zzi(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final zzc(Ljava/lang/String;J)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 0

    .line 1
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzmm;->zzi(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final zzd(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzmm;->zzh()Lcom/google/android/libraries/places/internal/zzmk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p2, v0, Lcom/google/android/libraries/places/internal/zzmk;->zzb:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p1, v0, Lcom/google/android/libraries/places/internal/zzmk;->zza:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final zze(Ljava/lang/String;Z)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzmm;->zzi(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final zzf(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzmm;->zzh()Lcom/google/android/libraries/places/internal/zzmk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/google/android/libraries/places/internal/zzmk;->zzb:Ljava/lang/Object;

    .line 6
    .line 7
    return-object p0
.end method

.method public final zzg()Lcom/google/android/libraries/places/internal/zzmm;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzmm;->zzd:Z

    return-object p0
.end method
