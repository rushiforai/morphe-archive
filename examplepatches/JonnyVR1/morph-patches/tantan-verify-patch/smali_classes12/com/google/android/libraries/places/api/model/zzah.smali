.class final Lcom/google/android/libraries/places/api/model/zzah;
.super Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;
.source "SourceFile"


# instance fields
.field private zza:Lcom/google/android/libraries/places/api/model/LocalDate;

.field private zzb:Lcom/google/android/libraries/places/api/model/DayOfWeek;

.field private zzc:Lcom/google/android/libraries/places/api/model/LocalTime;

.field private zzd:Z

.field private zze:B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public final build()Lcom/google/android/libraries/places/api/model/TimeOfWeek;
    .locals 4

    .line 1
    iget-byte v0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zze:B

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzb:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzc:Lcom/google/android/libraries/places/api/model/LocalTime;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v2, Lcom/google/android/libraries/places/api/model/zzbw;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/google/android/libraries/places/api/model/zzah;->zza:Lcom/google/android/libraries/places/api/model/LocalDate;

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzd:Z

    .line 20
    .line 21
    invoke-direct {v2, v3, v0, v1, p0}, Lcom/google/android/libraries/places/api/model/zzbw;-><init>(Lcom/google/android/libraries/places/api/model/LocalDate;Lcom/google/android/libraries/places/api/model/DayOfWeek;Lcom/google/android/libraries/places/api/model/LocalTime;Z)V

    .line 22
    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzb:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 31
    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    const-string v1, " day"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzc:Lcom/google/android/libraries/places/api/model/LocalTime;

    .line 40
    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    const-string v1, " time"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_3
    iget-byte p0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zze:B

    .line 49
    .line 50
    if-nez p0, :cond_4

    .line 51
    .line 52
    const-string p0, " truncated"

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "Missing required properties:"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return-object p0
.end method

.method public final getDate()Lcom/google/android/libraries/places/api/model/LocalDate;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zza:Lcom/google/android/libraries/places/api/model/LocalDate;

    return-object p0
.end method

.method public final getDay()Lcom/google/android/libraries/places/api/model/DayOfWeek;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzb:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"day\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getTime()Lcom/google/android/libraries/places/api/model/LocalTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzc:Lcom/google/android/libraries/places/api/model/LocalTime;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"time\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final isTruncated()Z
    .locals 1

    .line 1
    iget-byte v0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zze:B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzd:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const-string p0, "Property \"truncated\" has not been set"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final setDate(Lcom/google/android/libraries/places/api/model/LocalDate;)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/api/model/LocalDate;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zza:Lcom/google/android/libraries/places/api/model/LocalDate;

    return-object p0
.end method

.method public final setDay(Lcom/google/android/libraries/places/api/model/DayOfWeek;)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzb:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null day"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setTime(Lcom/google/android/libraries/places/api/model/LocalTime;)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzc:Lcom/google/android/libraries/places/api/model/LocalTime;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null time"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setTruncated(Z)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zzd:Z

    const/4 p1, 0x1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzah;->zze:B

    return-object p0
.end method
