.class final Lcom/google/android/gms/internal/mlkit_language_id_common/zzz;
.super Lcom/google/android/gms/internal/mlkit_language_id_common/zzu;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzz;->zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzu;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic get(I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzz;->zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;->zzh(Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "index"

    .line 8
    .line 9
    invoke-static {p1, v0, v1}, Ll/j3y0;->a(IILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzz;->zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;

    .line 13
    .line 14
    add-int/2addr p1, p1

    .line 15
    invoke-static {p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;->zzi(Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;)[Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    aget-object v0, v0, p1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;->zzi(Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    aget-object p0, p0, p1

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    new-instance p1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    .line 36
    .line 37
    invoke-direct {p1, v0, p0}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-object p1
.end method

.method public final size()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzz;->zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;

    invoke-static {p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;->zzh(Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;)I

    move-result p0

    return p0
.end method
