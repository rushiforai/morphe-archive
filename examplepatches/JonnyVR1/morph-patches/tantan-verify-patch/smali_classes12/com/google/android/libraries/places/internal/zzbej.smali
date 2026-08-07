.class public abstract Lcom/google/android/libraries/places/internal/zzbej;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbqp;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract zzc()Lcom/google/android/libraries/places/internal/zzbei;
.end method

.method public abstract zzd()Lcom/google/android/libraries/places/internal/zzbis;
.end method

.method public zzp()Z
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final zzr()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzd()Lcom/google/android/libraries/places/internal/zzbis;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbis;->zzf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzd()Lcom/google/android/libraries/places/internal/zzbis;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbis;->zzc()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final zzs(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzc()Lcom/google/android/libraries/places/internal/zzbei;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzbei;->zzn(Lcom/google/android/libraries/places/internal/zzbei;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzt()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzc()Lcom/google/android/libraries/places/internal/zzbei;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbei;->zzv()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzu(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzc()Lcom/google/android/libraries/places/internal/zzbei;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzbei;->zzo(Lcom/google/android/libraries/places/internal/zzbei;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final zzv(Lcom/google/android/libraries/places/internal/zzazc;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzd()Lcom/google/android/libraries/places/internal/zzbis;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbis;->zza(Lcom/google/android/libraries/places/internal/zzazc;)Lcom/google/android/libraries/places/internal/zzbis;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzw(Ljava/io/InputStream;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzd()Lcom/google/android/libraries/places/internal/zzbis;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbis;->zzf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzd()Lcom/google/android/libraries/places/internal/zzbis;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbis;->zze(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbjd;->zzi(Ljava/io/Closeable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :goto_1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbjd;->zzi(Ljava/io/Closeable;)V

    .line 26
    .line 27
    .line 28
    throw p0
.end method
