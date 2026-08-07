.class final Lcom/google/android/libraries/places/internal/zzbkn;
.super Lcom/google/android/libraries/places/internal/zzbbk;
.source "SourceFile"


# instance fields
.field final synthetic zza:Ljava/lang/Throwable;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbbe;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbma;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbkn;->zza:Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbbk;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 7
    .line 8
    const-string v0, "Panic! This is a bug!"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbbe;->zza(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbbe;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbkn;->zzb:Lcom/google/android/libraries/places/internal/zzbbe;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbkn;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzmn;->zza(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "panicPickResult"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkn;->zzb:Lcom/google/android/libraries/places/internal/zzbbe;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzmm;->zzd(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzmm;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final zza(Lcom/google/android/libraries/places/internal/zzbbf;)Lcom/google/android/libraries/places/internal/zzbbe;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkn;->zzb:Lcom/google/android/libraries/places/internal/zzbbe;

    return-object p0
.end method
