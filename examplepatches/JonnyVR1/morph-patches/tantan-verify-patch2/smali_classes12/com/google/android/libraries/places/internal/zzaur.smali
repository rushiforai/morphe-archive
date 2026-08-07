.class final Lcom/google/android/libraries/places/internal/zzaur;
.super Lcom/google/android/libraries/places/internal/zzaut;
.source "SourceFile"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    const/4 p0, 0x0

    throw p0
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzauq;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzaut;-><init>(Lcom/google/android/libraries/places/internal/zzaus;)V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;J)Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauc;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzauc;->zzc()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/16 v0, 0xa

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    add-int/2addr v0, v0

    .line 23
    :goto_0
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzauc;->zzd(I)Lcom/google/android/libraries/places/internal/zzauc;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p1, p2, p3, p0}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-object p0
.end method

.method public final zzb(Ljava/lang/Object;J)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauc;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzauc;->zzb()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final zzc(Ljava/lang/Object;Ljava/lang/Object;J)V
    .locals 3

    .line 1
    invoke-static {p1, p3, p4}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauc;

    .line 6
    .line 7
    invoke-static {p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/google/android/libraries/places/internal/zzauc;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    if-lez v1, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzauc;->zzc()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    add-int/2addr v1, v0

    .line 32
    invoke-interface {p0, v1}, Lcom/google/android/libraries/places/internal/zzauc;->zzd(I)Lcom/google/android/libraries/places/internal/zzauc;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :cond_0
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    :cond_1
    if-gtz v0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    move-object p2, p0

    .line 43
    :goto_0
    invoke-static {p1, p3, p4, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
