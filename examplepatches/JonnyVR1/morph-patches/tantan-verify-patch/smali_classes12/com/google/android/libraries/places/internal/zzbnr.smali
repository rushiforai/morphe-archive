.class public final Lcom/google/android/libraries/places/internal/zzbnr;
.super Lcom/google/android/libraries/places/internal/zzbbf;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzayj;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbcf;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzbcl;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbbf;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "method"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzc:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 12
    .line 13
    const-string p1, "callOptions"

    .line 14
    .line 15
    invoke-static {p3, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zza:Lcom/google/android/libraries/places/internal/zzayj;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Lcom/google/android/libraries/places/internal/zzbnr;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbnr;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zza:Lcom/google/android/libraries/places/internal/zzayj;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/google/android/libraries/places/internal/zzbnr;->zza:Lcom/google/android/libraries/places/internal/zzayj;

    .line 22
    .line 23
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzmo;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/google/android/libraries/places/internal/zzbnr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 32
    .line 33
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzmo;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzc:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzbnr;->zzc:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzmo;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    return v0

    .line 50
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zza:Lcom/google/android/libraries/places/internal/zzayj;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzc:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 6
    .line 7
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zza:Lcom/google/android/libraries/places/internal/zzayj;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzc:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "[method="

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, " headers="

    .line 30
    .line 31
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, " callOptions="

    .line 38
    .line 39
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p0, "]"

    .line 46
    .line 47
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final zza()Lcom/google/android/libraries/places/internal/zzayj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zza:Lcom/google/android/libraries/places/internal/zzayj;

    return-object p0
.end method

.method public final zzb()Lcom/google/android/libraries/places/internal/zzbcf;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    return-object p0
.end method

.method public final zzc()Lcom/google/android/libraries/places/internal/zzbcl;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnr;->zzc:Lcom/google/android/libraries/places/internal/zzbcl;

    return-object p0
.end method
