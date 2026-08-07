.class final Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;
.super Lcom/google/android/gms/internal/mlkit_language_id_common/zzw;
.source "SourceFile"


# static fields
.field static final zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzw;


# instance fields
.field final transient zzb:[Ljava/lang/Object;

.field private final transient zzc:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v2, v1}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzw;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;[Ljava/lang/Object;I)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzw;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzb:[Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzc:I

    return-void
.end method

.method public static zzg(I[Ljava/lang/Object;Ll/xzy0;)Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    aget-object p0, p1, p0

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    aget-object v0, p1, p2

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/zgy0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzb:[Ljava/lang/Object;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzc:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    :cond_0
    move-object p0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_1
    const/4 v2, 0x1

    .line 11
    if-ne p0, v2, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    aget-object p0, v0, p0

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    aget-object p0, v0, v2

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    :goto_0
    if-nez p0, :cond_2

    .line 31
    .line 32
    return-object v1

    .line 33
    :cond_2
    return-object p0
.end method

.method public final size()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzc:I

    return p0
.end method

.method public final zza()Lcom/google/android/gms/internal/mlkit_language_id_common/zzq;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzac;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzb:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzc:I

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzac;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final zzd()Lcom/google/android/gms/internal/mlkit_language_id_common/zzx;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzb:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v3, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzc:I

    .line 7
    .line 8
    invoke-direct {v0, p0, v1, v2, v3}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzaa;-><init>(Lcom/google/android/gms/internal/mlkit_language_id_common/zzw;[Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final zze()Lcom/google/android/gms/internal/mlkit_language_id_common/zzx;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzac;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzb:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v3, p0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzad;->zzc:I

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzac;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/google/android/gms/internal/mlkit_language_id_common/zzab;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzab;-><init>(Lcom/google/android/gms/internal/mlkit_language_id_common/zzw;Lcom/google/android/gms/internal/mlkit_language_id_common/zzu;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method
